defmodule JustStore.Repositories.CartRepository do
  alias JustStore.Schemas.Cart
  alias JustStore.Repo

  def create_cart() do
    %Cart{}
    |> Repo.insert()
  end

  def get_cart_by_id(cart_id) do
    Repo.get(Cart, cart_id)
  end

  def list_items_from_cart(cart_id) do
    Repo.get(JustStore.Schemas.Cart, cart_id) |> Repo.preload(items: [:item_details])
  end

  def total_price_of_cart_items(cart_id) do
    cart = list_items_from_cart(cart_id)

    total_price = cart.items
    |> Enum.map(fn item -> item.item_details.price * item.quantity end)
    |> Enum.sum()

    {:ok, total_price}
  end

  def total_price_of_cart_items_a_vista(cart_id) do
    cart = list_items_from_cart(cart_id)

    total_price = cart.items
    |> Enum.map(fn item -> item.item_details.price * item.quantity end)
    |> Enum.sum()

    total_price_a_vista = Float.round(total_price * 0.9, 2)  #Desconto de 10% a vista e 2 casas decimais

    {:ok, total_price_a_vista}
  end

end
