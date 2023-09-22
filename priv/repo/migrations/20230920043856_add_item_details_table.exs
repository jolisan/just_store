defmodule JustStore.Repo.Migrations.AddItemDetailsTable do
  use Ecto.Migration

  def change do
    create table(:item_details) do
      add :name, :string
      add :description, :string
      add :price, :float
      timestamps()
    end
  end
end
