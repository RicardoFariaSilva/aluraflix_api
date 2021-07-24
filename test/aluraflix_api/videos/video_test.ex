defmodule AluraflixApi.Videos.VideoTest do
  use AluraflixApi.DataCase

  describe "videos" do
    alias AluraflixApi.Videos.Video

    @valid_attrs %{description: "some really cool description",
                  title: "some really cool title",
                  url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y"}

    test "title attribute must have at least 5 chars" do
      attrs = %{@valid_attrs | title: "I"}
      changeset = Video.changeset(%Video{}, attrs)
      assert %{title: ["should be at least 5 character(s)"]} = errors_on(changeset)
    end

    test "title attribute must have max 100 chars" do
      attrs = %{@valid_attrs | title: String.duplicate("I", 101) }
      changeset = Video.changeset(%Video{}, attrs)
      assert %{title: ["should be at most 100 character(s)"]} = errors_on(changeset)
    end

    test "description attribute must have at least 10 chars" do
      attrs = %{@valid_attrs | description: "I"}
      changeset = Video.changeset(%Video{}, attrs)
      assert %{description: ["should be at least 10 character(s)"]} = errors_on(changeset)
    end

    test "description attribute must have max 500 chars" do
      attrs = %{@valid_attrs | description: String.duplicate("I", 501) }
      changeset = Video.changeset(%Video{}, attrs)
      assert %{description: ["should be at most 500 character(s)"]} = errors_on(changeset)
    end

    test "url attribute must have at least 10 chars" do
      attrs = %{@valid_attrs | url: "I"}
      changeset = Video.changeset(%Video{}, attrs)
      assert %{url: ["Invalid URL format", "should be at least 10 character(s)"]} = errors_on(changeset)
    end

    test "url attribute must have max 300 chars" do
      attrs = %{@valid_attrs | url: "https://www.youtube.com/watch?v=sa1G-zU7f9Y" <> String.duplicate("I", 301) }
      changeset = Video.changeset(%Video{}, attrs)
      assert %{url: ["should be at most 300 character(s)"]} = errors_on(changeset)
    end
  end

end
