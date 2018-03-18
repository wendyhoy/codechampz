class StudentDrillGroupsController < ApplicationController


  # GET /student_drill_groups
  def index
    @student_drill_groups = StudentDrillGroup.where(user_id: current_user.id).order(created_at: :DESC)
  end


  # POST /student_drill_groups
  def create

    if StudentDrillGroup.where(user_id: current_user,
      drill_group_id: params[:drill_group_id]).present?
      flash[:alert] = 'The drill group is already existed'
    else
      drill_group = DrillGroup.find params[:drill_group_id]
      student_drill_group = StudentDrillGroup.new(
        user: current_user,
        drill_group: drill_group
      )
      if student_drill_group.save
        flash[:notice] = 'Drill group added successfully!'
      else
        flash[:alert] = 'Sorry, couln\'t add the Drill group'
      end
    end

    redirect_to user_student_drill_groups_path(current_user)

  end

  # DELETE /student_drill_groups/1
  def destroy
    student_drill_group = StudentDrillGroup.find params[:id]
    student_drill_group.destroy
    redirect_to user_student_drill_groups_path(current_user)
  end


end
