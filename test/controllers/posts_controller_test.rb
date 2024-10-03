require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  let(:user) { create(:user) }

  before(:each) do
    sign_in_as(user)
  end

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
      assert_difference("Post.count", 1) do
        post posts_url, params: { post: { title: "Test title", message: "Test" } }
      end

      assert_redirected_to post_url(Post.last)
    end
  end

  describe "GET /posts/:id" do
    let(:post) { create(:post, user: user) }

    test "should be successful" do
      get post_url(post)

      assert_response :success
    end
  end

  describe "GET /posts/:id/edit" do
    let(:post) { create(:post, user: user) }

    test "should be successful" do
      get edit_post_url(post)

      assert_response :success
    end

    test "should redirect non-owners" do
      non_owner = create(:user)
      sign_in_as(non_owner)
      get edit_post_url(post)

      assert_redirected_to posts_url
    end
  end

  describe "PATCH /posts/:id" do
    let(:post) { create(:post, user: user) }

    test "should update post and correctly redirect" do
      title = "New title"
      message = "New message"
      patch post_url(post), params: { post: { title: title, message: message } }

      assert_equal title, post.reload.title
      assert_equal message, post.message.to_plain_text
      assert_redirected_to post_url(post)
    end

    test "should redirect non-owners" do
      non_owner = create(:user)
      sign_in_as(non_owner)
      patch post_url(post), params: { post: { title: "", message: "" } }

      assert_redirected_to posts_url
    end
  end

  describe "DELETE /posts/:id" do
    test "should destroy post and correctly redirect" do
      post = create(:post, user: user)

      assert_difference("Post.count", -1) do
        delete post_url(post)
      end

      assert_redirected_to posts_url
    end

    test "should redirect non-owners" do
      post = create(:post, user: user)
      non_owner = create(:user)
      sign_in_as(non_owner)
      delete post_url(post)

      assert_redirected_to posts_url
    end
  end
end
