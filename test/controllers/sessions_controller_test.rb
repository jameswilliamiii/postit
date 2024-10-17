require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  describe "GET /sessions/new" do
    test "should be successful" do
      get new_session_url

      assert_response :success
    end
  end # GET /sessions/new

  describe "POST /sessions" do
    test "should authenticate and redirect" do
      user = create(:user)
      post session_url, params: { email_address: user.email_address, password: user.password }

      assert_redirected_to root_url
    end

    test "should not authenticate and redirect" do
      user = create(:user)
      post session_url, params: { email_address: user.email_address, password: "wrong" }

      assert_redirected_to new_session_url
    end
  end # POST /sessions

  describe "DELETE /sessions" do
    test "should terminate and redirect" do
      user = create(:user)
      # Authenticate to set session
      post session_url, params: { email_address: user.email_address, password: user.password }
      # Delete session
      delete session_url

      assert_redirected_to new_session_url
    end
  end # DELETE /sessions
end
