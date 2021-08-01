defmodule AluraflixApiWeb.Api.V1.Categories.VideoController do
  use AluraflixApiWeb, :controller

  alias AluraflixApi.Categories

  action_fallback AluraflixApiWeb.Api.V1.FallbackController

  def index(conn, %{"category_id" => category_id}) do
    category = Categories.get_category_with_videos!(category_id)
    render(conn, "show_with_videos.json", category: category)
  end
end
