defmodule JustStoreWeb.SchemaTest do
  use JustStoreWeb.ConnCase, async: true

  describe "test create cart mutation" do
    test "when call the function creates a cart", %{conn: conn} do
      query = """
        mutation {
          createCart{id}
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(200)

        id = response["data"]["createCart"]["id"]

        assert is_integer(id)

    end
  end

  describe "test add item to cart mutation" do
    test "when calling the function adds an item to the cart", %{conn: conn} do
      query = """
        mutation {
          addItemToCart(cartId: 1, itemDetailsId: 3, quantity: 15) {
            id
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(200)

      id = response["data"]["addItemToCart"]["id"]

      assert is_integer(id)
    end
  end

  describe "test remove item from cart mutation" do
    test "when calling the function removes an item from the cart", %{conn: conn} do
      query = """
        mutation {
          removeItemFromCart(cartId: 1, itemDetailsId: 3, quantity: 10) {
            id
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(200)

      id = response["data"]["removeItemFromCart"]["id"]

      assert is_integer(id)
    end
  end

  describe "test the cart viewing" do
    test "when calling the cart qry, it returns the cart information", %{conn: conn} do
      query = """
        {
          cart(cartId: 1) {
            id
            totalCartValue
            items {
              quantity
              itemDetails {
                name
                description
                price
              }
            }
            totalCartValueAVista
            updatedAt
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(200)

      cart = response["data"]["cart"]

      expected_fields = %{
        "id" => "1"
      }

      assert Map.take(cart, Map.keys(expected_fields)) == expected_fields
    end
  end

  describe "test remove item from cart mutation - fail" do
    test "when calling the function removes an item from the cart - fail", %{conn: conn} do
      query = """
        mutation {
          removeItemFromCart(cartId: 1999, itemDetailsId: 3, quantity: 10) {
            id
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(200)

      id = response["data"]["removeItemFromCart"]["id"]

      assert is_integer(id)
    end
  end

end
