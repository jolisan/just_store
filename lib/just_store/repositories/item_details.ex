defmodule JustStore.Repositories.ItemDetailsRepository do
  alias JustStore.Schemas.ItemDetails
  alias JustStore.Repo

  def create_item_details(attrs) do
    %ItemDetails{}
    |> ItemDetails.changeset(attrs)
    |> Repo.insert()
  end

  def get_item_details_by_id(id) do
    Repo.get(ItemDetails, id)
  end

  def mock_item_details() do
    item_details_data = [
      %{name: "Tenis", description: "Dunk Panda Low", price: 29.99},
      %{name: "Meia", description: "Meia Nike Cano Alto", price: 10},
      %{name: "Camiseta", description: "Camiseta Nike Dryfit", price: 35.50}
    ]
    Enum.each(item_details_data, fn attrs ->
      %ItemDetails{}
      |> ItemDetails.changeset(attrs)
      |> Repo.insert()
    end)
  end

end
