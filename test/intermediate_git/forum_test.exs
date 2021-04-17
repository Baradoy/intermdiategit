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

  describe "comment" do
    alias IntermediateGit.Forum.Comment

    @valid_attrs %{message: "some message"}
    @update_attrs %{message: "some updated message"}
    @invalid_attrs %{message: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Forum.create_comment()

      comment
    end

    test "list_comment/0 returns all comment" do
      comment = comment_fixture()
      assert Forum.list_comment() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Forum.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Forum.create_comment(@valid_attrs)
      assert comment.message == "some message"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forum.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{} = comment} = Forum.update_comment(comment, @update_attrs)
      assert comment.message == "some updated message"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Forum.update_comment(comment, @invalid_attrs)
      assert comment == Forum.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Forum.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Forum.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Forum.change_comment(comment)
    end
  end
end
