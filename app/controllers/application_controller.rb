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


  private

  def authenticate_user!
   redirect_to sign_in_path, notice: "Please sign in" unless user_signed_in?
  end

end
