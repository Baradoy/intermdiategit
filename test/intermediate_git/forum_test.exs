defmodule IntermediateGit.ForumTest do
  use IntermediateGit.DataCase

  alias IntermediateGit.Forum

  describe "posts" do
    alias IntermediateGit.Forum.Post

    @valid_attrs %{message: "some message", tags: "some tags", title: "some title"}
    @update_attrs %{message: "some updated message", tags: "some updated tags", title: "some updated title"}
    @invalid_attrs %{message: nil, tags: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forum.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Forum.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Forum.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Forum.create_post(@valid_attrs)
      assert post.message == "some message"
      assert post.tags == "some tags"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forum.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Forum.update_post(post, @update_attrs)
      assert post.message == "some updated message"
      assert post.tags == "some updated tags"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Forum.update_post(post, @invalid_attrs)
      assert post == Forum.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Forum.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Forum.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Forum.change_post(post)
    end
  end
end
