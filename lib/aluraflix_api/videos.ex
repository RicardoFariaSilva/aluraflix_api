defmodule AluraflixApi.Videos do
  @moduledoc """
  The Videos context.
  """

  import Ecto.Query, warn: false

  alias Ecto.Changeset
  alias AluraflixApi.Repo
  alias AluraflixApi.Videos.Video
  alias AluraflixApi.Categories.Category
  alias AluraflixApi.Categories
  alias AluraflixApiWeb.Paginator

  @doc """
  Returns the list of videos.

  ## Examples

      iex> list_videos()
      [%Video{}, ...]

  """
  def list_videos(page \\ "1") do
    Paginator.paginate(Video, page)
  end

  @doc """
  Returns the list of videos filtered by title search.

  ## Examples

      iex> list_videos_by_search()
      [%Video{}, ...]

  """
  def list_videos_by_search(search, page \\ "1") do
    like = "%#{search}%"
    from(v in Video,
      where: like(v.title, ^like),
    ) |> Paginator.paginate(page)
  end

  @doc """
  Gets a single video.

  Raises `Ecto.NoResultsError` if the Video does not exist.

  ## Examples

      iex> get_video!(123)
      %Video{}

      iex> get_video!(456)
      ** (Ecto.NoResultsError)

  """
  def get_video!(id), do: Repo.get!(Video, id)

  @doc """
  Creates a video.

  ## Examples

      iex> create_video(%{field: value})
      {:ok, %Video{}}

      iex> create_video(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_video(attrs \\ %{}) do
    category = handle_category(attrs)

    %Video{}
    |> Video.changeset(attrs)
    |> Changeset.put_assoc(:category, category)
    |> Repo.insert()
  end

  defp handle_category(attrs) do
    case Map.has_key?(attrs, :category_id) do
      false -> find_category(nil)
      true -> find_category(attrs[:category_id])
    end
  end

  defp find_category(nil) do
    Category |> first() |> Repo.one!()
  end
  defp find_category(category_id) do
    Categories.get_category!(category_id)
  end

  @doc """
  Updates a video.

  ## Examples

      iex> update_video(video, %{field: new_value})
      {:ok, %Video{}}

      iex> update_video(video, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a video.

  ## Examples

      iex> delete_video(video)
      {:ok, %Video{}}

      iex> delete_video(video)
      {:error, %Ecto.Changeset{}}

  """
  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking video changes.

  ## Examples

      iex> change_video(video)
      %Ecto.Changeset{data: %Video{}}

  """
  def change_video(%Video{} = video, attrs \\ %{}) do
    Video.changeset(video, attrs)
  end

  @doc """
  Returns the list of free videos. They are created in seeds script.

  ## Examples

      iex> free_videos()
      [%Video{}, ...]

  """
  def free_videos do
    from(v in Video,
        join: c in assoc(v, :category),
        where: c.title == "Free")
    |> Repo.all
  end
end
