defmodule IntermediateGit.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comment) do
      add :message, :string
      add :post_id, references(:posts, on_delete: :delete_all)

      timestamps()
    end

  end
end
