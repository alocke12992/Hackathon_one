class commentsController < ApplicationController
  before_action :set_user
  before_action :set_comment, only: [:show, :edit, :update, :destroy ]

  def index
    @comments = @user.comments
  end

  def show
  end

  def new
    @comment = @user.comments.new
  end

  def edit
    @comment = 
  end

  def create
    @comment = @user.comments.new(comment_params)

    if @comment.save
      redirect_to user_comment_path(@user, @comment)
      #redirect_to [@user, @comment]
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_comment_path(@user, @comment)
      #redirect_to [@user, @comment]
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_comments_path
  end

  private

    def set_user
      @user = user.find(params[:user_id])
    end

    def set_comment
      @comment = comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :body)
    end








end
