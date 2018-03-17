class StudentDrillsController < ApplicationController
  before_action :set_student_drill, only: [:show, :edit, :update, :destroy]

  # GET /student_drills
  # GET /student_drills.json
  def index
    @student_drills = StudentDrill.all
  end

  # GET /student_drills/1
  # GET /student_drills/1.json
  def show
  end

  # GET /student_drills/new
  def new
    @student_drill = StudentDrill.new
  end

  # GET /student_drills/1/edit
  def edit
  end

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

  # PATCH/PUT /student_drills/1
  # PATCH/PUT /student_drills/1.json
  def update
    respond_to do |format|
      if @student_drill.update(student_drill_params)
        format.html { redirect_to @student_drill, notice: 'Student drill was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_drill }
      else
        format.html { render :edit }
        format.json { render json: @student_drill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_drills/1
  # DELETE /student_drills/1.json
  def destroy
    @student_drill.destroy
    respond_to do |format|
      format.html { redirect_to student_drills_url, notice: 'Student drill was successfully destroyed.' }
      format.json { head :no_content }
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
