defmodule JustStoreWeb.Resolvers.Cart do
  alias JustStore.Repositories.CartRepository
  alias JustStore.Schemas.Cart

  def get_cart_items(%{cart_id: cart_id}, _) do
    case CartRepository.list_items_from_cart(cart_id) do
      %Cart{} = cart ->
        {:ok, cart}
      nil ->
        {:error, "Carrinho não encontrado"}
    end
  end

  def create_cart(_, _) do
    case CartRepository.create_cart() do
      {:ok, cart} ->
        {:ok, cart}
      {:error, reason} ->
        {:error, reason}
    end
  end
end
