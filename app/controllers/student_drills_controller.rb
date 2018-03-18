class StudentDrillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_drill, only: [:show, :edit, :update, :destroy]


  # POST /student_drills
  # POST /student_drills.json
  def create

    # get the users attempted answer and drill
    attempted_answer = student_drill_params[:answer]
    drill = Drill.find params[:drill_id]

    # check if the attempted answer matches one of the solutions in the drill
    correct = false
    drill.solutions.each do |solution|
      if solution.solution == attempted_answer
        correct = true
        break
      end
    end

    # save whether the user answered the drill correctly in the
    # StudentDrill table
    student_drill = StudentDrill.new(
      user: current_user,
      drill: drill,
      is_correct: correct
    )

    student_drill.save

    # find the next drill in the drill group
    next_drill_index = 0
    drill.drill_group.drills.each_with_index do |d,i|
      if d.id == drill.id
        next_drill_index = i+1
        break
      end
    end

    if next_drill_index >= drill.drill_group.drills.length
      # finished the drill group
      redirect_to user_student_drill_groups_path(current_user)
    else
      # redirect to the next drill in the drill group
      redirect_to drill_path(drill.drill_group.drills[next_drill_index])
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
