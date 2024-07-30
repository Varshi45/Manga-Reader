# app/controllers/admin/users_controller.rb
module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    def index
      @users = User.where(admin: false)
    end

    def show
      @user = User.find(params[:id])
      @recent_ratings = Rating.where(user_id: @user.id).order(created_at: :desc).limit(3)
      @recent_comments = Comment.where(user_id: @user.id).order(created_at: :desc).limit(3)
    end

    private

    def require_admin
      redirect_to root_path, alert: "You must be an admin to access this section" unless current_user.admin?
    end
  end
end
