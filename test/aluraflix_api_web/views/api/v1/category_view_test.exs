defmodule AluraflixApiWeb.Api.V1.CategoryViewTest do
  use AluraflixApiWeb.ConnCase, async: true

  import Phoenix.View

  alias AluraflixApi.Categories.Category

  @category %Category{
    title: "Comedy",
    color: "#FF00FF"
  }

  test "index.json renders many category.json" do
    expected_response = %{data: [
                          %{
                            title: "Comedy",
                            color: "#FF00FF",
                            id: nil
                          },
                          %{
                            title: "Comedy",
                            color: "#FF00FF",
                            id: nil
                          }
                        ]}
    assert render(AluraflixApiWeb.Api.V1.CategoryView, "index.json", %{categories: [@category, @category]}) == expected_response
  end

  test "show.json renders one category.json" do
    expected_response = %{data: %{
                                  title: "Comedy",
                                  color: "#FF00FF",
                                  id: nil
                                }
                          }
    assert render(AluraflixApiWeb.Api.V1.CategoryView, "show.json", %{category: @category}) == expected_response
  end
end
