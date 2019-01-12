class WelcomeController < ApplicationController
  def index
    @books = @books.where("? = any(tags)", params[:q]) if params[:q].present?
    @books = Book.order("rating_average desc").limit(10)
  end
end
