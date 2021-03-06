class CommentsController < ApplicationController
  before_action :find_book

  def show
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.book = @book
    @favorite = Favorite.find_or_initialize_by(book: @book, user: current_user)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "The comment has been added"
      redirect_to book_path(@book)
    else
      render 'books/show'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "The comment has been updated"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "The comment has been deleted"
    redirect_to book_path(@book)
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
     params.require(:comment).permit(:user, :body, :rating)
  end
end
