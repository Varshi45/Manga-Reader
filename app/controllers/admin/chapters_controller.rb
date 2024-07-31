class Admin::ChaptersController < ApplicationController
  before_action :set_manga

  def new
    @chapter = @manga.chapters.build
  end

  def create
    @chapter = @manga.chapters.build(chapter_params)
    if @chapter.save
      redirect_to admin_manga_path(@manga), notice: 'Chapter was successfully created.'
    else
      render :new
    end
  end

  def index
  end

  private

  def set_manga
    @manga = Manga.find(params[:manga_id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :link)
  end
end
