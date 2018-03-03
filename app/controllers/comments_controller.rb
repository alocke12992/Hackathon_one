class CommentsController < ApplicationController
  before_action :set_movie

  def new
    @comment = Comment.new
  end

  def show
  end

  def edit
    redirect_to :edit
  end

  def create
    @comment = @movie.comments.new(comment_params)
    if @comment.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to movie_comment_path(@movie, @comment)
    else
      render :edit
    end

    def destroy
      @topic.destroy
      redirect_to movie_comments_path
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end



    def comment_params
      params.require(:comment).permit(:body)
    end

end
