defmodule IntermediateGit.Forum.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias IntermediateGit.Forum.Post

  schema "comment" do
    field :message, :string

    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:message])
    |> validate_required([:message])
  end
end
