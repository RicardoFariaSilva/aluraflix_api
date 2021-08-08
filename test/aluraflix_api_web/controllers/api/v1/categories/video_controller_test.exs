defmodule AluraflixApiWeb.Api.V1.Categories.VideoControllerTest do
  use AluraflixApiWeb.ConnCase

  alias AluraflixApi.{Categories, Videos, Accounts}
  alias AluraflixApiWeb.Auth.Guardian

  setup %{conn: conn} do
    {:ok, user} = Accounts.create_user(%{email: "email1@test.com", password: "password"})
    {:ok, jwt, _claims} = Guardian.encode_and_sign(user)
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("authorization", "Bearer #{jwt}")

    {:ok, conn: conn}
  end

  @category_attrs %{
    title: "Comedy",
    color: "#00FF00"
  }

  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(@category_attrs)
      |> Categories.create_category()

    category
  end

  describe "index" do
    # GET api/v1/categories/:category_id/videos
    test "renders category with videos", %{conn: conn} do
      category = category_fixture()
      video_attrs = %{
        description: "some description really cool",
        title: "some title really cool",
        url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y",
        category_id: category.id
      }
      {:ok, video} = Videos.create_video(video_attrs)
      video_id = video.id

      conn = get(conn, Routes.api_v1_category_video_path(conn, :index, category.id))
      assert "#00FF00" = json_response(conn, 200)["color"]
      assert "Comedy" = json_response(conn, 200)["title"]
      assert [
        %{
          "description" => "some description really cool",
          "id" => ^video_id,
          "title" => "some title really cool",
          "url" => "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
        }
      ] = json_response(conn, 200)["videos"]
    end
  end
end
