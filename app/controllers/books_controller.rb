class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :authorize_book, only: [:edit, :update, :destroy]
  # def index
  #   @books = Book.all.order("created_at desc")
  #   @books = @books.where("? = any(tags)", params[:q]) if params[:q].present?
  # end
  def index
    if params[:title]
       @books = Book.where('title LIKE ?', "%#{params[:title]}%")
     else
       @books = Book.all
     end
  end

  def show
  end

  def new
    @book = Book.new
    @user = User.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user if current_user
    if @book.save
      flash[:notice] = "The book has been added"
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "The book has been updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
      flash[:notice] = "The book has been deleted"
      redirect_to books_path
  end

  private
  def authorize_book
     if current_user != @book.user && !current_user&.admin?
       flash[:alert] = "You are not allowed to be here"
       redirect_to books_path
       false
     else
       true
     end
   end

  def book_params
    params[:book].permit(:title, :description, :pages, :date, :isbn, :language, :tags, :user, author_ids:[])
  end

  def find_book
    @book = Book.find(params[:id])
  end
end
