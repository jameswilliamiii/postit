require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  let(:user) { create(:user) }

  before(:each) do
    sign_in_as(user)
  end

  describe "GET /profile" do
    it "should get the profile page" do
      get profile_path
      assert_response :success
    end
  end

  describe "PATCH /profile" do
    let(:params) do
      {
        user: {
          name: "New Name",
          email_address: "new@email.com"
        }
      }
    end

    it "should update the profile and correctly redirect" do
      patch profile_path, params: params

      assert_redirected_to profile_path
      assert_equal "Profile updated!", flash[:notice]
    end

    it "should render show when profile is not updated" do
      params[:user][:email_address] = nil

      patch profile_path, params: params

      assert_response :unprocessable_entity
      assert_equal "Your profile could not be updated. Please address any errors below.", flash[:alert]
    end
  end
end
