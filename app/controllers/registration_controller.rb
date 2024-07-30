# app/controllers/registration_controller.rb
class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)
    @user.admin = false
    if @user.save
      login @user
      redirect_to user_dashboard_path, notice: "You have successfully signed up!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

