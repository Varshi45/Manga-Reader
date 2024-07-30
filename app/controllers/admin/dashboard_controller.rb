module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_admin!

    def index
      @mangas = Manga.all
    end

    private

    def authenticate_admin!
      unless current_user&.admin?
        redirect_to root_path, alert: "You must be an admin to access this section"
      end
    end
  end
end
