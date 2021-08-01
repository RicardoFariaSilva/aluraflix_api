defmodule AluraflixApiWeb.Api.V1.Categories.VideoView do
  use AluraflixApiWeb, :view
  alias AluraflixApiWeb.Api.V1.VideoView

  def render("show_with_videos.json", %{category: category}) do
    %{id: category.id,
      title: category.title,
      color: category.color,
      videos: render_many(category.videos, VideoView, "video.json", as: :video)}
  end
end
