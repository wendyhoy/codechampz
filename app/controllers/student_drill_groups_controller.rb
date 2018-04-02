class StudentDrillGroupsController < ApplicationController

  # GET /student_drill_groups
  def index
    @student_drill_groups = current_user.student_drill_groups
    @drill_groups = @student_drill_groups.map do |sdg| sdg.drill_group end
    @beginner_drill_groups = []
    @intermediate_drill_groups = []
    @advanced_drill_groups = []

    sort_by_level
  end
  helper_method :sort_by_name

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

    redirect_to drill_groups_path
  end

  # DELETE /student_drill_groups/1
  def destroy
    student_drill_group = StudentDrillGroup.find params[:id]
    student_drill_group.destroy
    redirect_to user_student_drill_groups_path(current_user), notice: "Drill group is deleted."
  end


  private

  def sort_by_level
    @drill_groups.each do |dg|
      if dg.present? && dg.drills.present?
        case dg.level
        when 1
          @beginner_drill_groups << dg
        when 2
          @intermediate_drill_groups << dg
        when 3
          @advanced_drill_groups << dg
        end
      end
    end
  end

  def sort_by_name(drill_groups)
    drill_groups.sort { |a,b| a[:name] <=> b[:name] }
  end

  def student_drill_group_params
    params.permit(:user_id, :drill_group_id, :points_awarded, :score)
  end

end
