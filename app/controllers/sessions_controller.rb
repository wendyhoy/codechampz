class SessionsController < ApplicationController

  def new
    if current_user.present?
      if current_user.is_admin?
        redirect_to drill_groups_path
      else
        redirect_to user_student_drill_groups_path(current_user)
      end
    end
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thank you for signing in!"
      if user.is_admin?
        redirect_to drill_groups_path
      else
        redirect_to user_student_drill_groups_path(user)
      end
    else
      flash.now[:alert] = 'Wrong email or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Signed out!'
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
