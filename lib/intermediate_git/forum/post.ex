defmodule IntermediateGit.Forum.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :message, :string
    field :tags, :string
    field :title, :string

    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:message, :tags, :title])
    |> validate_required([:message, :tags, :title])
  end
end
