class ChaptersController < ApplicationController
    def new
      @manga = Manga.find(params[:manga_id])
      @chapter = @manga.chapters.build
    end
  
    def index
      @manga = Manga.find(params[:manga_id])
      @chapters = @manga.chapters
    end
  end
  