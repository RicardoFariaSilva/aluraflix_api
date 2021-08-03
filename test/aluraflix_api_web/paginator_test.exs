defmodule AluraflixApiWeb.PaginatorTest do
  use AluraflixApi.DataCase

  alias AluraflixApi.Videos.Video
  alias AluraflixApi.Videos
  alias AluraflixApiWeb.Paginator

  def fixture(:video) do
    {:ok, video} = Videos.create_video(%{
      description: "some description really cool",
      title: "some title really cool",
      url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
    })
    video
  end

  describe "when the page is nil" do
    test "sets the page to the first page" do
      create_videos(1)

      paginator = Paginator.paginate(Video, nil)

      assert paginator.current_page == 1
    end
  end

  describe "when the page is a string" do
    test "sets the page to an integer" do
      create_videos(1)

      paginator = Paginator.paginate(Video, "1")

      assert paginator.current_page == 1
    end
  end

  test "paginate as 5 results per page" do
    create_videos(8)

    paginator_first_page = Paginator.paginate(Video, 1)
    assert length(paginator_first_page.list) == 5
  end

  test "prints pagination info" do
    create_videos(1)

    paginator = Paginator.paginate(Video, 1)

    assert paginator.current_page == 1
    assert paginator.results_per_page == 5
  end

  defp create_videos(quantity) do
    for _n <- 1..quantity do
      fixture(:video)
    end
  end
end
