defmodule JustStore.Schemas.ItemDetails do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_details" do
    field :name, :string
    field :description, :string
    field :price, :decimal

    belongs_to :item, JustStore.Schemas.Item

    timestamps()
  end

  def changeset(item_details, attrs) do
    item_details
    |> cast(attrs, [:name, :description, :price])
    |> validate_required([:name, :description, :price])
    |> validate_number(:price, greater_than_or_equal_to: 0)
  end
end
