defmodule JustStore.Schemas.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    belongs_to :cart, JustStore.Schemas.Cart
    belongs_to :item_details, JustStore.Schemas.ItemDetails
    field :quantity, :integer

    timestamps()
  end

  def changeset(item, attrs) do
    item
    |> cast(attrs, [:cart_id, :item_details_id, :quantity])
    |> validate_required([:cart_id, :item_details_id, :quantity])
    |> validate_number(:quantity, greater_than_or_equal_to: 0)
  end
end
