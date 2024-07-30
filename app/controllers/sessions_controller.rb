# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email].downcase, admin: false)
    if user && user.authenticate(params[:user][:password])
      login(user)
      redirect_to user_dashboard_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Logged out!"
  end
end
