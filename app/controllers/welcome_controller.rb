class WelcomeController < ApplicationController
  def index
    @books = @books.where("? = any(tags)", params[:q]) if params[:q].present?
    @books = Book.where("rating_average is not null").order("rating_average desc").limit(10)
  end
end
