defmodule AluraflixApi.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false
      add :color, :string, null: false

      timestamps()
    end
  end
end
