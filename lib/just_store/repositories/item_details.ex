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
end
