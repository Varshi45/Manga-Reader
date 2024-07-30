# app/controllers/password_resets_controller.rb
class PasswordResetsController < ApplicationController
  before_action :set_user_by_token, only: [:edit, :update]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      @token = user.signed_id(purpose: "password_reset", expires_in: 15.minutes)
      PasswordMailer.with(user: user, token: @token).password_reset.deliver_later
    end
    redirect_to root_path, notice: "If an account with that email exists, you will receive an email with password reset instructions."
  end

  def edit
    # The @user is set by set_user_by_token
  end

  def update
    if @user.update(password_params)
      redirect_to new_session_path, notice: "Password updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user_by_token
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    redirect_to new_password_reset_path, alert: "Invalid Action! Please try again" unless @user.present?
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
