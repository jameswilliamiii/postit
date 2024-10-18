class Account::PasswordsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to account_password_path, notice: "Password updated!"
    else
      flash.now[:alert] = "Password not updated!"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: %i[password password_confirmation])
  end
end
