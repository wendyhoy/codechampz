class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def index
    @users = User.order :created_at
  end


  def show
  end


  def new
    @user = User.new
  end


  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully signed up!"
      redirect_to root_path
    else
      render :new
    end
  end


  def update
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_admin)
    end
end
