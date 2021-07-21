defmodule AluraflixApi.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false
      add :description, :string, null: false
      add :url, :string, null: false

      timestamps()
    end

  end
end
