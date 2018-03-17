class DrillGroupsController < ApplicationController
  before_action :set_drill_group, only: [:show, :edit, :update, :destroy]

  # GET /drill_groups
  # GET /drill_groups.json
  def index
    @drill_groups = DrillGroup.all
  end

  # GET /drill_groups/1
  # GET /drill_groups/1.json
  def show
  end

  # GET /drill_groups/new
  def new
    @drill_group = DrillGroup.new
  end

  # GET /drill_groups/1/edit
  def edit
  end

  # POST /drill_groups
  # POST /drill_groups.json
  def create
    @drill_group = DrillGroup.new(drill_group_params)

    respond_to do |format|
      if @drill_group.save
        format.html { redirect_to @drill_group, notice: 'Drill group was successfully created.' }
        format.json { render :show, status: :created, location: @drill_group }
      else
        format.html { render :new }
        format.json { render json: @drill_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drill_groups/1
  # PATCH/PUT /drill_groups/1.json
  def update
    respond_to do |format|
      if @drill_group.update(drill_group_params)
        format.html { redirect_to @drill_group, notice: 'Drill group was successfully updated.' }
        format.json { render :show, status: :ok, location: @drill_group }
      else
        format.html { render :edit }
        format.json { render json: @drill_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drill_groups/1
  # DELETE /drill_groups/1.json
  def destroy
    @drill_group.destroy
    respond_to do |format|
      format.html { redirect_to drill_groups_url, notice: 'Drill group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drill_group
      @drill_group = DrillGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drill_group_params
      params.require(:drill_group).permit(:name, :description, :level, :max_points, :user_id, :badge_name)
    end
end
