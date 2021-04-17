defmodule IntermediateGit.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :message, :string
      add :tags, :string
      add :title, :string

      timestamps()
    end

  end
end
