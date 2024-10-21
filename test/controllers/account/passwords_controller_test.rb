require "test_helper"

class Account::PasswordsControllerTest < ActionDispatch::IntegrationTest
  let(:password) { "password" }
  let(:user) { create(:user, password: password, password_confirmation: password) }

  before(:each) do
    sign_in_as(user)
  end

  describe "GET account/password/edit" do
    it "should be successful" do
      get edit_account_password_url

      assert_response :success
    end
  end

  describe "PATCH account/password" do
    let(:params) do
      {
        current_password: password,
        user: {
          password: password,
          password_confirmation: password
        }
      }
    end

    it "should update the password and correctly redirect" do
      patch account_password_url, params: params

      assert_redirected_to account_password_url
      assert_equal "Your password was updated!", flash[:notice]
    end

    it "should render edit when password confirmation does not match" do
      params[:user][:password_confirmation] = "wrong_password"

      patch account_password_url, params: params

      assert_response :unprocessable_entity
      assert_equal "Your password could not updated. Please address any errors below.", flash[:alert]
    end
  end
end
