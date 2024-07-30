# app/controllers/admin/sessions_controller.rb
module Admin
  class SessionsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      admin = User.find_by(email: params[:user][:email].downcase, admin: true)
      if admin && admin.authenticate(params[:user][:password])
        login(admin)
        redirect_to admin_dashboard_path
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
end
