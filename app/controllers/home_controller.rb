class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout "landing_page", only: :index

  def index
    if current_user.present?
      if current_user.is_admin?
        redirect_to drill_groups_path
      else
        redirect_to user_student_drill_groups_path(current_user)
      end
    end
  end

  def leaderboard
  end

end
