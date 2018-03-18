class StudentDrillsController < ApplicationController
  before_action :set_student_drill, only: [:show, :edit, :update, :destroy]


  # POST /student_drills
  # POST /student_drills.json
  def create
    byebug
    @student_drill = StudentDrill.new( params[:user_id],  )
    @student_drill.save
    # render json: params

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_drill
      @student_drill = StudentDrill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def student_drill_params
    #   params.require(:student_drill).permit(:answr)
    # end
end
