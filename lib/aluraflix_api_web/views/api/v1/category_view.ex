defmodule AluraflixApiWeb.Api.V1.CategoryView do
  use AluraflixApiWeb, :view
  alias AluraflixApiWeb.Api.V1.CategoryView

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      title: category.title,
      color: category.color}
  end
end
