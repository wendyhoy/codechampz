class SolutionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drill, except: [:edit]
  before_action :set_solution, only: [:edit, :update, :destroy]
  before_action :authorize_user!

  def new
    @solution = Solution.new
  end

  # POST /solutions
  def create
    @solution = Solution.new(solution_params)
    @solution.drill = @drill

    if @solution.save
      redirect_to @solution.drill, notice: 'Solution was successfully created.'
    else
      render :new
    end
  end

  def edit
    @drill = @solution.drill
  end

  # PATCH/PUT /solutions/1
  def update
    if @solution.update(solution_params)
      redirect_to @solution, notice: 'Solution was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /solutions/1
  def destroy
    @solution.destroy
    redirect_to solutions_url, notice: 'Solution was successfully destroyed.'
  end


  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_solution
    @solution = Solution.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def solution_params
    params.require(:solution).permit(:solution)
  end

  def set_drill
    @drill = Drill.find params[:drill_id]
  end

  def authorize_user!
    unless can?(:manage, @solution)
      flash[:alert] = "Access Denied!"
      redirect_to user_student_drill_groups_path(current_user)
    end
  end
end
