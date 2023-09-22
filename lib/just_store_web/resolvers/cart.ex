defmodule JustStoreWeb.Resolvers.Cart do
  alias JustStore.Repositories.CartRepository

  def get_cart_items(%{cart_id: cart_id}, _) do
    case CartRepository.list_items_from_cart(cart_id) do
      %JustStore.Schemas.Cart{} = cart ->
        {:ok, cart}
      nil ->
        {:error, "Carrinho não encontrado"}
    end
  end
end
