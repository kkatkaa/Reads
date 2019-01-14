class WelcomeController < ApplicationController
  def index
    @books = @books.where("? = any(tags)", params[:q]) if params[:q].present?
    @books = Book.where("average_ranking is not null").order("average_ranking desc").limit(10)
  end
end
