defmodule IntermediateGit.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comment) do
      add :message, :string

      timestamps()
    end

  end
end
