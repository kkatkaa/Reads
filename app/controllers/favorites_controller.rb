class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(book_id: params[:book_id], user: current_user)
    favorite.save
    redirect_to book_path(favorite.book)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to book_path(favorite.book)
  end
end
