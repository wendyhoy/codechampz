class SolutionsController < ApplicationController
  before_action :set_solution, only: [:update, :destroy]

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = Solution.new(solution_params)
      if @solution.save
        redirect_to @solution, notice: 'Solution was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
      if @solution.update(solution_params)
        redirect_to @solution, notice: 'Solution was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
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
      params.require(:solution).permit(:solution, :drill_id)
    end
end
