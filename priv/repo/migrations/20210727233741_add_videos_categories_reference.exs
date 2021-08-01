defmodule AluraflixApi.Repo.Migrations.AddVideosCategoriesReference do
  use Ecto.Migration

  def change do
    alter table(:videos) do
      add :category_id, references(:categories, type: :binary_id)
    end
  end
end
