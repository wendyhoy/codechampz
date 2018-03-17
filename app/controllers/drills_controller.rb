class DrillsController < ApplicationController
  before_action :set_drill, only: [:show, :edit, :update, :destroy]

  # GET /drills/1
  # GET /drills/1.json
  def show
    @solution = Solution.new
    @solutions = @drill.solutions.order(created_at: :asc)
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

      if @drill.save
        redirect_to @drill, notice: 'Drill was successfully created.'
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
      redirect_to edit_drill_group_path(@drill.drill_group), notice: 'Drill was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drill
      @drill = Drill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drill_params
      params.require(:drill).permit(:question, :drill_group_id)
    end
end
