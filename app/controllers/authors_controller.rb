class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :authorize_author, only: [:create, :new, :edit, :update, :destroy]

  def index
    @authors = Author.order('name asc').page(params[:page]).per(5)
  end

  def show
    @author.increment!(:views_count)
  end

  def new
    @author = Author.new
    @user = User.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    @author.user = current_user if current_user
    if @author.save
      flash[:notice] = "The author has been added"
      redirect_to @author
    else
      render 'new'
    end
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "The author has been updated"
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    flash[:notice] = "The author has been deleted"
    redirect_to authors_path
  end

  private

  def authorize_author
    if !current_user&.admin?
      flash[:alert] = "You are not allowed to be here"
      redirect_to authors_path
      false
    else
      true
    end
 end

  def author_params
    params[:author].permit(:name, :born, :description, :user, :image, book_ids:[])
  end

  def find_author
    @author = Author.find(params[:id])
  end
end
