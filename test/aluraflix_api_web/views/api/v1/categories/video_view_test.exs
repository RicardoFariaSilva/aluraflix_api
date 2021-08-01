defmodule AluraflixApiWeb.Api.V1.Categories.VideoViewTest do
  use AluraflixApiWeb.ConnCase, async: true

  import Phoenix.View

  alias AluraflixApi.Categories.Category
  alias AluraflixApi.Videos.Video

  @category %Category{
    title: "Comedy",
    color: "#FF00FF",
    id: nil,
    videos: [
      %Video{
        description: "some description really cool",
        title: "some title really cool",
        id: nil,
        url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
      }
    ]
  }

  test "show_with_videos.json renders correctly" do
    expected_response = %{color: "#FF00FF",
                          id: nil,
                          title: "Comedy",
                          videos: [%{description: "some description really cool",
                                    id: nil,
                                    title: "some title really cool",
                                    url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"}
                                  ]
                          }
    assert render(AluraflixApiWeb.Api.V1.Categories.VideoView, "show_with_videos.json", %{category: @category}) == expected_response
  end
end
