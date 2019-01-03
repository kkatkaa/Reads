class BooksController < ApplicationController
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
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @user = User.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user if current_user
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params[:book].permit(:title, :description, :pages, :date, :isbn, :language, :tags, :user, author_ids:[])
  end
end
