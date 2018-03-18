class StudentDrillGroupsController < ApplicationController


  # GET /student_drill_groups
  def index
    @student_drill_groups = StudentDrillGroup.where(user_id: current_user.id).order(created_at: :DESC)

  end


  # POST /student_drill_groups
  def create
    drill_group = DrillGroup.find params[:drill_group_id]

    student_drill_group = StudentDrillGroup.new student_drill_group_params
    student_drill_group.drill_group = drill_group
    student_drill_group.user = current_user

    if student_drill_group.save
      flash[:notice] = 'Drill group added successfully!'
    else
      flash[:alert] = 'Sorry, couln\'t add the Drill group'
    end

    redirect_to user_student_drill_groups_path

  end

  # DELETE /student_drill_groups/1
  def destroy
    student_drill_group = StudentDrillGroup.find params[:id]
    student_drill_group.destroy
    redirect_to user_student_drill_groups_path
  end

  private

    def student_drill_group_params
      params.require(:student_drill_group).permit(:user_id, :drill_group_id, :points_awarded, :score)
    end
end
