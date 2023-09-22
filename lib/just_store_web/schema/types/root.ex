defmodule JustStoreWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation
  alias JustStoreWeb.Resolvers.Cart, as: CartResolver

  import_types JustStoreWeb.Schema.Types.Cart

  object :root_query do
    field :cart, type: :cart do
      arg :cart_id, non_null(:integer)

      resolve &CartResolver.get_cart_items/2
    end
  end
end
