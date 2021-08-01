defmodule AluraflixApi.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  alias AluraflixApi.Videos.Video

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :title, :string
    field :color, :string
    has_many :videos, Video

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:title, :color])
    |> validate_required([:title, :color])
    |> validate_length(:title, min: 5, max: 100)
    |> validate_color(:color)
  end

  @color_regex ~r/^#([0-9A-F]{3}){1,2}$/i
  @invalid_color_message "Invalid color format"
  defp validate_color(changeset, field, _options \\ []) do
    validate_change(changeset, field, fn _, color ->
      valid_color = String.match?(color, @color_regex )
      case valid_color do
        false -> [{field, @invalid_color_message}]
        true -> []
      end
    end)
  end
end
