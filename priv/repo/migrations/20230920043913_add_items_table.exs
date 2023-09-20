defmodule JustStore.Repo.Migrations.AddItemsTable do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :cart_id, references(:carts)
      add :item_details_id, references(:item_details)
      add :quantity, :integer
      timestamps()
    end
  end
end
