defmodule JustStore.Repositories.ItemRepository do
  alias JustStore.Schemas.Item
  alias JustStore.Repo

  defp create_item(cart_id, item_details_id, quantity) do
    %Item{}
    |> Item.changeset(%{cart_id: cart_id, item_details_id: item_details_id, quantity: quantity})
    |> Repo.insert()
  end

  defp find_item(cart_id, item_details_id) do
    Repo.get_by(Item, cart_id: cart_id, item_details_id: item_details_id)
  end

  def add_item_to_cart(cart_id, item_details_id, quantity) do
    case find_item(cart_id, item_details_id) do
      %Item{} = existing_item ->
        new_quantity = existing_item.quantity + quantity
        if new_quantity > 0 do
          existing_item
          |> Item.changeset(%{quantity: new_quantity})
          |> Repo.update()
        end
      nil ->
        create_item(cart_id, item_details_id, quantity)
      end
  end

  def remove_item_from_cart(cart_id, item_details_id, quantity) do
    case find_item(cart_id, item_details_id) do
      %Item{} = existing_item ->
          new_quantity = existing_item.quantity - quantity
          if new_quantity > 0 do
            existing_item
            |> Item.changeset(%{quantity: new_quantity})
            |> Repo.update()
          else
            Repo.delete(existing_item)
          end
        nil ->
          {:error, "O item nao existe no carrinho"}
    end
  end

end
