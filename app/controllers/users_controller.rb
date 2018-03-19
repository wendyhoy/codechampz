class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorize_user!, except: [:new, :create]



  def index
    @users = User.order :created_at
  end


  def show
    get_user_points(params[:id])
    get_user_badges(params[:id])
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully signed up!"
      redirect_to drill_groups_path
    else
      render :new
    end
  end


  def edit
  end


  def update
    if @user.update user_params
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def authorize_user!
      unless can?(:manage, @user)
        flash[:alert] = "Access Denied!"
        redirect_to user_student_drill_groups_path(current_user)
      end
    end
end
