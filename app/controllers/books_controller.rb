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
    @book = Book.create!(params[:book].permit(:title, :description, :pages, :date, :isbn, :language))
    redirect_to action: "index"
  end
end
