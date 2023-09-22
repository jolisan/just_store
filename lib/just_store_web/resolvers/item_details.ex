defmodule JustStoreWeb.Resolvers.ItemDetails do
  alias JustStore.Repositories.ItemDetailsRepository

  def mock_item_details(_, _) do
    ItemDetailsRepository.mock_item_details()
  end

end
