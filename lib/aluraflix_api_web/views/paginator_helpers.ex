defmodule AluraflixApiWeb.PaginatorHelpers do

  def metadata(paginated) do
    %{
      current_page: paginated.current_page,
      results_per_page: paginated.results_per_page,
      total_pages: paginated.total_pages,
      total_results: paginated.total_results
    }
  end
end
