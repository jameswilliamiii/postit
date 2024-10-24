class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: "Profile updated!"
    else
      flash.now[:alert] = "Your profile could not be updated. Please address any errors below."
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: %i[name email_address password password_confirmation avatar_color])
  end
end
