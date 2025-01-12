class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
 
  def index
    @users = User.order(updated_at: :desc)
  end

  def new
    @user = User.new
  end

  def show
    @articles = @user.articles
  end

  def edit
  end

  def create
    @user = User.new(user_param)
    if @user.save!
      flash[:notice] = "Welcome #{@user.username}, you have sign up successfully"
      redirect_to articles_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_param)
      flash[:notice] = "update profile successfully"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "user profile deleted successfully"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_param
    permitted = [:username, :email]
    permitted << :password_digest if params[:user][:password_digest].present?
    params.require(:user).permit(permitted)
  end
end


