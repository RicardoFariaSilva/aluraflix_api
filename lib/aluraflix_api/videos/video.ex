defmodule AluraflixApi.Videos.Video do
  use Ecto.Schema
  import Ecto.Changeset

  alias AluraflixApi.Categories.Category

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:title, :description, :url, :category_id])
    |> validate_required([:title, :description, :url])
    |> validate_length(:title, min: 5, max: 100)
    |> validate_length(:description, min: 10, max: 500)
    |> validate_length(:url, min: 10, max: 300)
    |> validate_url_format(:url)
  end

  @invalid_url_message "Invalid URL format"
  defp validate_url_format(changeset, field, _options \\ []) do
    validate_change(changeset, field, fn _, url ->
      uri = URI.parse(url)
      case uri do
        %URI{scheme: nil} -> [{field, @invalid_url_message}]
        %URI{host: nil} -> [{field, @invalid_url_message}]
        ^uri -> []
      end
    end)
  end
end
