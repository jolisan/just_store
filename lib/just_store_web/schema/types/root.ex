defmodule JustStoreWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation
  alias JustStoreWeb.Resolvers.Cart, as: CartResolver
  alias JustStoreWeb.Resolvers.Item, as: ItemResolver
  alias JustStoreWeb.Resolvers.ItemDetails, as: ItemDetailsResolver


  import_types JustStoreWeb.Schema.Types.Cart

  object :root_query do
    field :cart, type: :cart do
      arg :cart_id, non_null(:integer)
      resolve &CartResolver.get_cart_items/2
    end
  end

  object :root_mutation do
    field :add_item_to_cart, :item do
      arg :cart_id, non_null(:id)
      arg :item_details_id, non_null(:id)
      arg :quantity, non_null(:integer)
      resolve &ItemResolver.add_item_to_cart/2
    end
    field :remove_item_from_cart, :item do
      arg :cart_id, non_null(:id)
      arg :item_details_id, non_null(:id)
      arg :quantity, non_null(:integer)
      resolve &ItemResolver.remove_item_from_cart/2
    end
    field :create_cart, :cart do
      resolve &CartResolver.create_cart/2
    end
    field :mock_item_details, :item_details do
      resolve &ItemDetailsResolver.mock_item_details/2
    end
  end

end
