class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search].present?
      @mangas = Manga.where('title ILIKE ?', "%#{params[:search]}%")
    else
      @mangas = Manga.all
    end

    @top_mangas = Manga.order(rating: :desc).limit(5)
  end

  def show
    @manga = Manga.find(params[:id])
    @user_rating = @manga.ratings.find_by(user: current_user)
    @manga.increment_views
  end

  def update_rating
    @manga = Manga.find(params[:id])
    existing_rating = @manga.ratings.find_by(user: current_user)

    if existing_rating
      if existing_rating.update(rating_params)
        @manga.update(rating: @manga.average_rating)
        redirect_to manga_path(@manga), notice: "Rating updated successfully!"
      else
        redirect_to manga_path(@manga), alert: "Failed to update rating."
      end
    else
      rating = @manga.ratings.build(rating_params.merge(user: current_user))
      if rating.save
        @manga.update(rating: @manga.average_rating)
        redirect_to manga_path(@manga), notice: "Rating added successfully!"
      else
        redirect_to manga_path(@manga), alert: "Failed to add rating."
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
