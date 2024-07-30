# app/controllers/admin/mangas_controller.rb
module Admin
  class MangasController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin
    before_action :set_manga, only: [:show, :edit, :update, :destroy]

    def new
      @manga = Manga.new
      @manga.images.build
    end

    def index
      @mangas = Manga.all
    end

    def show
    end

    def create
      @manga = Manga.new(manga_params)
      if @manga.save
        redirect_to admin_dashboard_path, notice: 'Manga was successfully added.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @manga.images.build if @manga.images.empty?
    end

    def update
      if @manga.update(manga_params)
        redirect_to admin_manga_path(@manga), notice: 'Manga was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @manga.destroy
      redirect_to admin_mangas_path, notice: 'Manga was successfully deleted.'
    end

    def analysis
      @mangas = Manga.includes(:comments).all
      @manga_analysis = @mangas.map do |manga|
        {
          title: manga.title,
          number_of_comments: manga.comments.count,
          number_of_visits: manga.views_count,
          average_rating: manga.ratings.average(:rating).to_f
        }
      end
      @manga_analysis.sort_by! { |analysis| -analysis[:number_of_visits] }
    end
    

    private

    def set_manga
      @manga = Manga.find(params[:id])
    end

    def manga_params
      params.require(:manga).permit(:title, :author, :first_published_date, :description, category: [], images_attributes: [:id, :link, :_destroy])
    end

    def require_admin
      redirect_to root_path, alert: "You must be an admin to access this section" unless current_user.admin?
    end
  end
end
