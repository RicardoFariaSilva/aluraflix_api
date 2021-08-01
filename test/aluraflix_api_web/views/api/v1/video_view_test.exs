defmodule AluraflixApiWeb.Api.V1.VideoViewTest do
  use AluraflixApiWeb.ConnCase, async: true

  import Phoenix.View

  alias AluraflixApi.Videos.Video

  @video %Video{
    description: "some description really cool",
    title: "some title really cool",
    url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
  }

  test "index.json renders many video.json" do
    expected_response = %{data: [
                          %{description: "some description really cool",
                            id: nil,
                            title: "some title really cool",
                            url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
                          },
                          %{description: "some description really cool",
                            id: nil,
                            title: "some title really cool",
                            url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
                          }
                        ]}
    assert render(AluraflixApiWeb.Api.V1.VideoView, "index.json", %{videos: [@video, @video]}) == expected_response
  end

  test "show.json renders one video.json" do
    expected_response = %{data: %{description: "some description really cool",
                                  id: nil,
                                  title: "some title really cool",
                                  url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
                                }
                          }
    assert render(AluraflixApiWeb.Api.V1.VideoView, "show.json", %{video: @video}) == expected_response
  end
end
