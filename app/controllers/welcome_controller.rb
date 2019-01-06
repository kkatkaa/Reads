class WelcomeController < ApplicationController
  def index
    @books = Book.all.order("created_at desc")
    @books = @books.where("? = any(tags)", params[:q]) if params[:q].present?
  end
end
