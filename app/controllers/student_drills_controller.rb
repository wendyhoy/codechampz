class StudentDrillsController < ApplicationController
  before_action :set_student_drill, only: [:show, :edit, :update, :destroy]


  # POST /student_drills
  # POST /student_drills.json
  def create
    @student_drill = StudentDrill.new(student_drill_params)

    respond_to do |format|
      if @student_drill.save
        format.html { redirect_to @student_drill, notice: 'Student drill was successfully created.' }
        format.json { render :show, status: :created, location: @student_drill }
      else
        format.html { render :new }
        format.json { render json: @student_drill.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_drill
      @student_drill = StudentDrill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_drill_params
      params.require(:student_drill).permit(:user_id, :drill_id, :is_correct)
    end
end
