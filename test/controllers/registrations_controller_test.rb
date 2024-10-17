require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  describe "GET /registrations/new" do
    it "should be successful" do
      get new_registration_url

      assert_response :success
    end
  end # GET /registrations/new

  describe "POST /registrations" do
    let(:params) do
      {
        user: {
          email_address: "test@example.com",
          password: "password",
          password_confirmation: "password",
          name: "Test User"
        }
      }
    end
    it "should create and redirect" do
      assert_difference("User.count", 1) do
        post registration_url, params: params
      end

      assert_redirected_to root_url
    end

    it "should create an organization and membership" do
      post registration_url, params: params

      user = User.find_by(email_address: params.dig(:user, :email_address))
      assert_equal user.name, user.organizations.first.name
      assert_equal "owner", user.memberships.first.role
    end

    it "should create and set session" do
      post registration_url, params: params

      assert cookies[:session_id].present?
    end

    it "should create and set flash notice" do
      post registration_url, params: params

      assert_equal "Welcome to PostIt! Start adding projects and tasks.", flash[:notice]
    end

    it "should not create and render" do
      params[:user][:password_confirmation] = "wrong"
      post registration_url, params: params

      assert_response :unprocessable_entity
      assert_equal "There was a problem creating your account.", flash[:alert]
    end
  end # POST /registration
end
