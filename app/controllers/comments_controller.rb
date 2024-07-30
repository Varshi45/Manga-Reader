class CommentsController < ApplicationController
  before_action :set_manga

  def create
    @comment = @manga.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to manga_path(@manga), notice: 'Comment was successfully created.'
    else
      render 'dashboard/show'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to manga_path(@comment.manga), notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to manga_path(@comment.manga), notice: 'Comment was successfully deleted.'
  end

  private

  def set_manga
    @manga = Manga.find(params[:manga_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
