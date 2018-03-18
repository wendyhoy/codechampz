class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if current_user.present?
      redirect_to user_student_drill_groups_path(current_user)
    end
  end

  def leaderboard
  end

end
