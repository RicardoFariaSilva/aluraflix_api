defmodule AluraflixApiWeb.Api.V1.VideoControllerTest do
  use AluraflixApiWeb.ConnCase

  alias AluraflixApi.Videos
  alias AluraflixApi.Videos.Video

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
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    # GET api/v1/videos
    test "lists all videos", %{conn: conn} do
      conn = get(conn, Routes.api_v1_video_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
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

  defp create_video(_) do
    video = fixture(:video)
    %{video: video}
  end
end
