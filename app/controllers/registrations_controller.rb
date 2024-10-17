class RegistrationsController < ApplicationController
  skip_before_action :require_authentication, only: %i[new create]

  def new
    @user = User.new
    @organization = Organization.new
  end

  def create
    User.transaction do
      @user = User.new(user_params)
      if @user.save
        @user.create_base_organization!
        start_new_session_for(@user)
        redirect_to root_path, notice: "Welcome to PostIt! Start adding projects and tasks."
      else
        flash.now[:alert] = "There was a problem creating your account."
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

    def user_params
      params.expect(
        user: [
          :email_address,
          :password,
          :password_confirmation,
          :name
        ]
      )
    end
end
