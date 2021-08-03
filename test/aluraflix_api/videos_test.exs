defmodule AluraflixApi.VideosTest do
  use AluraflixApi.DataCase

  alias AluraflixApi.{Categories, Videos}
  alias AluraflixApi.Repo

  describe "videos" do
    alias AluraflixApi.Videos.Video

    @valid_attrs %{description: "some description really cool",
                  title: "some title really cool",
                  url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"}
    @update_attrs %{description: "some updated description really cool", title: "some updated title really cool", url: "https://www.youtube.com/watch?v=OXBKB6ftDWg"}
    @invalid_attrs %{description: nil, title: nil, url: nil}

    def video_fixture(attrs \\ %{}) do
      {:ok, video} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Videos.create_video()

      video
    end

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(%{title: "testing", color: "#FFF"})
        |> Categories.create_category()

      category
    end

    test "list_videos/0 returns all videos" do
      video_fixture()
      assert length(Videos.list_videos()) != 0
    end

    test "list_videos_by_search/1 returns all videos with searched title" do
      video_fixture()
      assert length(Videos.list_videos_by_search("cool")) == 1
      assert length(Videos.list_videos_by_search("wrong")) == 0
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Repo.preload(Videos.get_video!(video.id), :category) == Repo.preload(video, :category)
    end

    test "create_video/1 with valid data creates a video" do
      assert {:ok, %Video{} = video} = Videos.create_video(@valid_attrs)
      assert video.description == "some description really cool"
      assert video.title == "some title really cool"
      assert video.url == "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
      assert video.category != nil
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Videos.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      assert {:ok, %Video{} = video} = Videos.update_video(video, @update_attrs)
      assert video.description == "some updated description really cool"
      assert video.title == "some updated title really cool"
      assert video.url == "https://www.youtube.com/watch?v=OXBKB6ftDWg"
    end

    test "update_video/2 with valid category" do
      category = category_fixture()
      video = video_fixture()
      assert {:ok, %Video{} = video} = Videos.update_video(video, %{category_id: category.id})
      assert video.category_id == category.id
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Videos.update_video(video, @invalid_attrs)
      assert Repo.preload(video, :category) == Repo.preload(Videos.get_video!(video.id), :category)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Videos.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Videos.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Videos.change_video(video)
    end
  end
end
