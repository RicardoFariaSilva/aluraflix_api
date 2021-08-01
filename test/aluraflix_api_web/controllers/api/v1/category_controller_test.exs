defmodule AluraflixApiWeb.Api.V1.CategoryControllerTest do
  use AluraflixApiWeb.ConnCase

  alias AluraflixApi.Categories
  alias AluraflixApi.Categories.Category

  @create_attrs %{
    title: "Comedy",
    color: "#00FF00"
  }
  @update_attrs %{
    title: "Horror",
    color: "#FF00FF"
  }
  @invalid_attrs %{title: nil, color: nil}

  def fixture(:category) do
    {:ok, category} = Categories.create_category(@create_attrs)
    category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    # GET api/v1/categories
    test "lists all categories", %{conn: conn} do
      conn = get(conn, Routes.api_v1_category_path(conn, :index))
      seeded_category = %{"color" => "#FFF", "id" => "1fcd05f3-432b-489d-917a-2304fc508c25", "title" => "Livre"}
      assert json_response(conn, 200)["data"] == [seeded_category]
    end
  end

  describe "create category" do
    # POST api/v1/categories
    test "renders category when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_v1_category_path(conn, :create), category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_v1_category_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "title" => "Comedy",
               "color" => "#00FF00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_v1_category_path(conn, :create), category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update category" do
    # PUT/PATCH api/v1/categories/:id
    setup [:create_category]

    test "renders category when data is valid", %{conn: conn, category: %Category{id: id} = category} do
      conn = put(conn, Routes.api_v1_category_path(conn, :update, category), category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_v1_category_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "title" => "Horror",
               "color" => "#FF00FF"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, category: category} do
      conn = put(conn, Routes.api_v1_category_path(conn, :update, category), category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete category" do
    # DELETE api/v1/categories/:id
    setup [:create_category]

    test "deletes chosen category", %{conn: conn, category: category} do
      conn = delete(conn, Routes.api_v1_category_path(conn, :delete, category))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_v1_category_path(conn, :show, category))
      end
    end
  end

  defp create_category(_) do
    category = fixture(:category)
    %{category: category}
  end
end
