defmodule AluraflixApiWeb.Api.V1.VideoView do
  use AluraflixApiWeb, :view
  alias AluraflixApiWeb.Api.V1.VideoView

  def render("index.json", %{videos: videos}) do
    %{data: render_many(videos, VideoView, "video.json")}
  end

  def render("show.json", %{video: video}) do
    %{data: render_one(video, VideoView, "video.json")}
  end

  def render("video.json", %{video: video}) do
    %{id: video.id,
      title: video.title,
      description: video.description,
      url: video.url}
  end
end
