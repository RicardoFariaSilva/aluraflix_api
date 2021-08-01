defmodule AluraflixApiWeb.Api.V1.VideoController do
  use AluraflixApiWeb, :controller

  alias AluraflixApi.Videos
  alias AluraflixApi.Videos.Video

  action_fallback AluraflixApiWeb.Api.V1.FallbackController

  def index(conn, params) do
    videos = find_videos(params)
    render(conn, "index.json", videos: videos)
  end

  defp find_videos(%{"search" => search}) do
    Videos.list_videos_by_search(search)
  end
  defp find_videos(%{}) do
    Videos.list_videos()
  end

  def create(conn, %{"video" => video_params}) do
    with {:ok, %Video{} = video} <- Videos.create_video(video_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_v1_video_path(conn, :show, video))
      |> render("show.json", video: video)
    end
  end

  def show(conn, %{"id" => id}) do
    video = Videos.get_video!(id)
    render(conn, "show.json", video: video)
  end

  def update(conn, %{"id" => id, "video" => video_params}) do
    video = Videos.get_video!(id)

    with {:ok, %Video{} = video} <- Videos.update_video(video, video_params) do
      render(conn, "show.json", video: video)
    end
  end

  def delete(conn, %{"id" => id}) do
    video = Videos.get_video!(id)

    with {:ok, %Video{}} <- Videos.delete_video(video) do
      send_resp(conn, :no_content, "")
    end
  end
end
