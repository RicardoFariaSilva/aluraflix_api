defmodule AluraflixApiWeb.Api.V1.VideoControllerTest do
  use AluraflixApiWeb.ConnCase

  alias AluraflixApi.{Videos, Accounts}
  alias AluraflixApi.Videos.Video
  alias AluraflixApiWeb.Auth.Guardian

  @create_attrs %{
    description: "some description really cool",
    title: "some title really cool",
    url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
  }
  @update_attrs %{
    description: "some updated description really cool",
    title: "some updated title really cool",
    url: "https://www.youtube.com/watch?v=OXBKB6ftDWg"
  }
  @invalid_attrs %{description: nil, title: nil, url: nil}

  def fixture(:video) do
    {:ok, video} = Videos.create_video(@create_attrs)
    video
  end

  setup %{conn: conn} do
    {:ok, user} = Accounts.create_user(%{email: "email1@test.com", password: "password"})
    {:ok, jwt, _claims} = Guardian.encode_and_sign(user)
    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> put_req_header("authorization", "Bearer #{jwt}")

    {:ok, conn: conn}
  end

  describe "index" do
    # GET api/v1/videos
    test "lists all videos when no search is given", %{conn: conn} do
      fixture(:video)
      conn = get(conn, Routes.api_v1_video_path(conn, :index))
      assert length(json_response(conn, 200)["data"]) != 0
    end

    test "lists all videos with page param", %{conn: conn} do
      fixture(:video)
      conn = get(conn, Routes.api_v1_video_path(conn, :index), page: "1")
      assert length(json_response(conn, 200)["data"]) != 0
      assert json_response(conn, 200)["metadata"]["current_page"] == 1
    end

    test "lists all videos with title given", %{conn: conn} do
      fixture(:video)

      conn = get(conn, Routes.api_v1_video_path(conn, :index), search: "cool")
      assert  [
        %{"description" => "some description really cool",
          "id" => _,
          "title" => "some title really cool",
          "url" => "https://www.youtube.com/watch?v=sa1G-zU7f9Y"}
      ] = json_response(conn, 200)["data"]
    end
  end

  describe "create video" do
    # POST api/v1/videos
    test "renders video when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_v1_video_path(conn, :create), video: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_v1_video_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some description really cool",
               "title" => "some title really cool",
               "url" => "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_v1_video_path(conn, :create), video: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update video" do
    # PUT/PATCH api/v1/videos/:id
    setup [:create_video]

    test "renders video when data is valid", %{conn: conn, video: %Video{id: id} = video} do
      conn = put(conn, Routes.api_v1_video_path(conn, :update, video), video: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_v1_video_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "description" => "some updated description really cool",
               "title" => "some updated title really cool",
               "url" => "https://www.youtube.com/watch?v=OXBKB6ftDWg"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, video: video} do
      conn = put(conn, Routes.api_v1_video_path(conn, :update, video), video: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete video" do
    # DELETE api/v1/videos/:id
    setup [:create_video]

    test "deletes chosen video", %{conn: conn, video: video} do
      conn = delete(conn, Routes.api_v1_video_path(conn, :delete, video))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_v1_video_path(conn, :show, video))
      end
    end
  end

  describe "free" do
    # GET api/v1/videos
    test "lists all free videos", %{conn: conn} do
      fixture(:video)
      conn = get(conn, Routes.api_v1_free_videos_path(conn, :free))
      assert length(json_response(conn, 200)["data"]) != 0
    end
  end

  defp create_video(_) do
    video = fixture(:video)
    %{video: video}
  end
end
