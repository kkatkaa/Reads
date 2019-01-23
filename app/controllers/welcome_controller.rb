class WelcomeController < ApplicationController
  def index
    @books = Book.where("average_ranking is not null").order("average_ranking desc").limit(10)
    @authors = Author.order('name asc')
  end
end
