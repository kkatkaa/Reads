class FavoritesController < ApplicationController
  def update
    favorite = Favorite.where(book: Book.find(params[:book]), user: current_user)
    if favorite == []
      Favorite.create(book: Book.find(params[:book]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end

    redirect_to book_path(params[:book])
  end
end
