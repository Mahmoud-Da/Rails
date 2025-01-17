class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.order(updated_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def show 
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def update 
    if @user.update(user_params)
      flash[:notice] = "User was updated successfully"
      redirect_to @user
    else 
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username}, you have successfully signed up"
      redirect_to users_path
    else
      render :new
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    permitted = [:username, :email]
    permitted << :password_digest if params[:user][:password_digest].present?
    params.require(:user).permit(permitted)
  end
end
