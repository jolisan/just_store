defmodule JustStore.Schemas.Cart do
  use Ecto.Schema

  schema "carts" do
    timestamps()
    has_many :items, JustStore.Schemas.Item
  end
end
