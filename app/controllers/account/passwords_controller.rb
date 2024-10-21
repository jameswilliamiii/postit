class Account::PasswordsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to account_password_path, notice: "Your password was updated!"
    else
      flash.now[:alert] = "Your password could not updated. Please address any errors below."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(user: %i[password password_confirmation])
  end
end
