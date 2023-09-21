defmodule JustStore.Repositories.CartRepository do
  alias JustStore.Schemas.Cart
  alias JustStore.Schemas.Item
  alias JustStore.Repo

  def create_cart() do
    %Cart{}
    |> Repo.insert()
  end

  def get_cart_by_id(cart_id) do
    Repo.get(Cart, cart_id)
  end

  def list_items_from_cart(cart_id) do
    Repo.get_by(Item, cart_id: cart_id)
  end

end
