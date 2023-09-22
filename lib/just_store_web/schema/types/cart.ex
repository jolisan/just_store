defmodule JustStoreWeb.Schema.Types.Cart do
  use Absinthe.Schema.Notation
  alias JustStore.Repositories.CartRepository

  object :cart do
    field :id, :id
    field :items, list_of(:item)
    field :total_cart_value, :string do
      resolve fn (cart, _, _) ->
        CartRepository.total_price_of_cart_items(cart.id)
      end
    end
    field :total_cart_value_a_vista, :string do
      resolve fn (cart, _, _) ->
        CartRepository.total_price_of_cart_items_a_vista(cart.id)
      end
    end
    field :inserted_at, :string
    field :updated_at, :string
  end

  object :item do
    field :id, :id
    field :item_details, :item_details
    field :quantity, :integer
    field :inserted_at, :string
    field :updated_at, :string
  end

  object :item_details do
    field :id, :id
    field :name, :string
    field :description, :string
    field :price, :float
    field :inserted_at, :string
    field :updated_at, :string
  end

end
