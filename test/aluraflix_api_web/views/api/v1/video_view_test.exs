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

  test "index_paginated.json renders many video.json with pagination metadata" do
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
                        ], metadata: %{
                            current_page: 1,
                            results_per_page: 1,
                            total_pages: 1,
                            total_results: 1
                          }
                        }
      paginated = %{
        current_page: 1,
        results_per_page: 1,
        total_pages: 1,
        total_results: 1,
        list: [@video, @video]
      }
    assert render(AluraflixApiWeb.Api.V1.VideoView, "index_paginated.json", %{paginated: paginated}) == expected_response
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
