defmodule JustStoreWeb.Resolvers.Item do
  alias JustStore.Repositories.ItemRepository

  def add_item_to_cart(%{cart_id: cart_id, item_details_id: item_details_id, quantity: quantity}, _) do
    case ItemRepository.add_item_to_cart(cart_id, item_details_id, quantity) do
      {:ok, item} ->
        {:ok, item}
      {:error, reason} ->
        {:error, reason}
    end
  end

  def remove_item_from_cart(%{cart_id: cart_id, item_details_id: item_details_id, quantity: quantity}, _) do
    case ItemRepository.remove_item_from_cart(cart_id, item_details_id, quantity) do
      {:ok, item} ->
        {:ok, item}
      {:error, reason} ->
        {:error, reason}
    end
  end
end
