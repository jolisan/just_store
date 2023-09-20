defmodule JustStore.Repo.Migrations.AddCartsTable do
  use Ecto.Migration

  def change do
    create table (:carts) do
      timestamps()
    end
  end
end
