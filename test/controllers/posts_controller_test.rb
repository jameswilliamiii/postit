require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  describe " GET /posts" do
    test "should be successful" do
      get posts_url

      assert_response :success
    end
  end

  describe "GET /posts/new" do
    test "should be successful" do
      create(:user) # TODO: replace once authentication built
      get new_post_url

      assert_response :success
    end
  end

  describe "POST /posts" do
    test "should create a post and correctly redirect" do
      create(:user) # TODO: replace once authentication built

      assert_difference("Post.count", 1) do
        post posts_url, params: { post: { title: "Test title", message: "Test", user_id: User.last.id } }
      end

      assert_redirected_to post_url(Post.last)
    end
  end

  describe "GET /posts/:id" do
    let(:post) { create(:post) }

    test "should be successful" do
      get post_url(post)

      assert_response :success
    end
  end

  describe "GET /posts/:id/edit" do
    let(:post) { create(:post) }

    test "should be successful" do
      get edit_post_url(post)

      assert_response :success
    end
  end

  describe "PATCH /posts/:id" do
    let(:post) { create(:post) }

    test "should update post and correctly redirect" do
      create(:user) # TODO: replace once authentication built
      title = "New title"
      message = "New message"
      patch post_url(post), params: { post: { title: title, message: message } }

      assert_equal title, post.reload.title
      assert_equal message, post.message.to_plain_text
      assert_redirected_to post_url(post)
    end
  end

  describe "DELETE /posts/:id" do
    test "should destroy post and correctly redirect" do
      post = create(:post)

      assert_difference("Post.count", -1) do
        delete post_url(post)
      end

      assert_redirected_to posts_url
    end
  end
end
