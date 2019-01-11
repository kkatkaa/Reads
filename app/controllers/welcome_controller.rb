class WelcomeController < ApplicationController
  def index
    @books = @books.where("? = any(tags)", params[:q]) if params[:q].present?
    @books = Book.all.order("rating_average desc")
  end
end
