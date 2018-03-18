class DrillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drill, only: [:show, :edit, :update, :destroy]
  before_action :set_drill_group, only: [:new, :create]
  before_action :authorize_user!, except: :show


  # GET /drills/1
  # GET /drills/1.json
  def show
    @solution = Solution.new
    @solutions = @drill.solutions.order(created_at: :asc)
    @student_drill_group_id = params[:sdgid]
  end

  # GET /drills/new
  def new
    @drill = Drill.new
  end

  # GET /drills/1/edit
  def edit
  end

  # POST /drills
  # POST /drills.json
  def create
    @drill = Drill.new(drill_params)
    @drill.drill_group = @drill_group

      if @drill.save
        redirect_to drill_group_path(@drill_group), notice: 'Drill was successfully created.'
      else
        render :new
      end

  end

  # PATCH/PUT /drills/1
  # PATCH/PUT /drills/1.json
  def update
      if @drill.update(drill_params)
        redirect_to @drill, notice: 'Drill was successfully updated.'
      else
        render :edit
      end

  end

  # DELETE /drills/1
  # DELETE /drills/1.json
  def destroy
    @drill.destroy
      redirect_to drill_group_path(@drill.drill_group), notice: 'Drill was successfully destroyed.'
  end

  def solutions
    @solutions = @drill.solutions
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drill
      @drill = Drill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drill_params
      params.require(:drill).permit(:question, solutions_attributes: [:id, :solution])
    end

    def set_drill_group
      @drill_group = DrillGroup.find params[:drill_group_id]
    end

    def authorize_user!
      unless can?(:manage, @drill)
        flash[:alert] = "Access Denied!"
        redirect_to user_student_drill_groups_path(current_user)
      end
    end
end
