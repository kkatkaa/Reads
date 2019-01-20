class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.all
  end

  def edit
    @user = current_user
  end
end
