class BooksController < ApplicationController
  def index
    @books = Book.all.order("created_at desc")
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book].permit(:title, :description, :pages, :date, :isbn, :language))
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end
end
