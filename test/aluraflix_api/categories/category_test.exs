defmodule AluraflixApi.Categories.CategoryTest do
  use AluraflixApi.DataCase

  describe "categories" do
    alias AluraflixApi.Categories.Category

    @valid_attrs %{title: "Comedy",
                  color: "#FF0000"}

    test "title attribute must have at least 5 chars" do
      attrs = %{@valid_attrs | title: "I"}
      changeset = Category.changeset(%Category{}, attrs)
      assert %{title: ["should be at least 5 character(s)"]} = errors_on(changeset)
    end

    test "title attribute must have max 100 chars" do
      attrs = %{@valid_attrs | title: String.duplicate("I", 101) }
      changeset = Category.changeset(%Category{}, attrs)
      assert %{title: ["should be at most 100 character(s)"]} = errors_on(changeset)
    end

    test "color attribute must be a hex color string" do
      attrs = %{@valid_attrs | color: "123"}
      changeset = Category.changeset(%Category{}, attrs)
      assert %{color: ["Invalid color format"]} = errors_on(changeset)
    end
  end
end
