class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in?
    current_user.present?
  end
  helper_method :user_signed_in?


  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  helper_method :current_user

  def get_user_points(this_user)
      user_points = StudentDrillGroup.where({
      user: this_user
    })
    @points = user_points.sum(:points_awarded)  
  end

  helper_method :get_user_points

  def get_user_badges(this_user)
    drill_groups = StudentDrillGroup.where(user: this_user, score: 100).pluck("drill_group_id")
    @badges = []

    drill_groups.each do |d_id|
      @badges << DrillGroup.find(d_id)
    end
  end

  helper_method :get_user_badges


  private

  def authenticate_user!
   redirect_to sign_in_path, notice: "Please sign in" unless user_signed_in?
  end

end
