class StudentDrillGroupsController < ApplicationController
  before_action :set_student_drill_group, only: [:show, :edit, :update, :destroy]

  # GET /student_drill_groups
  # GET /student_drill_groups.json
  def index
    @student_drill_groups = StudentDrillGroup.all
  end

  # GET /student_drill_groups/1
  # GET /student_drill_groups/1.json
  def show
  end

  # GET /student_drill_groups/new
  def new
    @student_drill_group = StudentDrillGroup.new
  end

  # GET /student_drill_groups/1/edit
  def edit
  end

  # POST /student_drill_groups
  # POST /student_drill_groups.json
  def create
    @student_drill_group = StudentDrillGroup.new(student_drill_group_params)

    respond_to do |format|
      if @student_drill_group.save
        format.html { redirect_to @student_drill_group, notice: 'Student drill group was successfully created.' }
        format.json { render :show, status: :created, location: @student_drill_group }
      else
        format.html { render :new }
        format.json { render json: @student_drill_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_drill_groups/1
  # PATCH/PUT /student_drill_groups/1.json
  def update
    respond_to do |format|
      if @student_drill_group.update(student_drill_group_params)
        format.html { redirect_to @student_drill_group, notice: 'Student drill group was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_drill_group }
      else
        format.html { render :edit }
        format.json { render json: @student_drill_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_drill_groups/1
  # DELETE /student_drill_groups/1.json
  def destroy
    @student_drill_group.destroy
    respond_to do |format|
      format.html { redirect_to student_drill_groups_url, notice: 'Student drill group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_drill_group
      @student_drill_group = StudentDrillGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_drill_group_params
      params.require(:student_drill_group).permit(:user_id, :drill_group_id, :points_awarded, :score)
    end
end
