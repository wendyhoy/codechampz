class StudentDrillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_drill, only: [:show, :edit, :update, :destroy]

  # this gets called whenever a student completes a question
  def create
    # byebug
    # get the user's attempted answer, drill, and current student drill group
    attempted_answer = student_drill_params[:answer]
    @drill = Drill.find params[:drill_id]
    # student_drill_group = StudentDrillGroup.find params[:student_drill_group_id]

    # check if the attempted answer matches one of the solutions in the drill
    solutions_arr = @drill.solutions.map { |s| s.solution }
    correct = solutions_arr.include? attempted_answer

    if correct
      @correct = true
    else
      @correct = false
    end

    # save whether the user answered the drill correctly in the
    # StudentDrill table
    student_drill = StudentDrill.new(
      user: current_user,
      drill: @drill,
      is_correct: correct
    )

    student_drill.save

    @answered = true

    render 'drills/show'
  end

  def next
    drill = Drill.find params[:drill_id]
    student_drill_group = StudentDrillGroup.find params[:student_drill_group_id]

    # find the next drill in the drill group
    next_drill_index = 0
    drill_group = drill.drill_group
    drill_list = drill_group.drills

    drill_list.each_with_index do |d,i|
      if d.id == drill.id
        next_drill_index = i+1
        break
      end
    end

    # check if the user's finished the drill group
    total_drills = drill_list.length
    if next_drill_index >= total_drills

      # the user is finished, update the points_awarded and score
      answers = StudentDrill.where(user: current_user).order(created_at: :desc).limit(total_drills)
      num_correct = answers.count { |answer| answer.is_correct }

      points_per_drill = drill_group.max_points / total_drills
      points_awarded = points_per_drill * num_correct
      percentage = 100 * points_awarded / drill_group.max_points

      highest_points = [student_drill_group.points_awarded, points_awarded].max
      highest_score = [student_drill_group.score, percentage].max

      student_drill_group.points_awarded = highest_points
      student_drill_group.score = highest_score
      student_drill_group.times_taken += 1

      student_drill_group.save

      # redirect the user to their drills page
      flash[:notice] = "You scored: #{points_awarded} points, #{percentage}%. Your best score: #{highest_points} points, #{highest_score}%."
      redirect_to user_student_drill_groups_path(current_user)
    else
      # redirect to the next drill in the drill group
      redirect_to drill_path({
        id: drill.drill_group.drills[next_drill_index],
        sdgid: params[:student_drill_group_id]
      })
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_drill
      @student_drill = StudentDrill.find(params[:id])
    end

    def student_drill_params
      params.require(:attempt).permit(:answer)
    end
end
