class WelcomeController < ApplicationController
  def index
    if params[:q]
       @books = Book.where('tag LIKE ?', "%#{params[:q]}%")
     else
       @books = Book.all
     end
  end
end
