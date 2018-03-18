class DrillGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drill_group, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, except: [:show, :index]

  # GET /drill_groups
  # GET /drill_groups.json
  def index
    @drill_groups = DrillGroup.order :level
    @beginner_group = DrillGroup.where(level: 1).order :name
    @intermediate_group = DrillGroup.where(level: 2).order :name
    @advanced_group = DrillGroup.where(level: 3).order :name

    if current_user.is_admin?
      render '/admin/drill_groups/index'
    end
  end

  # GET /drill_groups/1
  # GET /drill_groups/1.json
  def show
    @drills = @drill_group.drills
    @friendly_level = @drill_group.friendly_level

    if current_user.is_admin?
      render '/admin/drill_groups/show'
    else
      render
    end
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
    @drill_group.user = current_user

      if @drill_group.save
        redirect_to @drill_group, notice: 'Drill group was successfully created.'
      else
        render :new
      end

  end

  # PATCH/PUT /drill_groups/1
  # PATCH/PUT /drill_groups/1.json
  def update

      if @drill_group.update(drill_group_params)
        redirect_to @drill_group, notice: 'Drill group was successfully updated.'
      else
        render :edit
      end

  end

  # DELETE /drill_groups/1
  # DELETE /drill_groups/1.json
  def destroy
    @drill_group.destroy
    redirect_to drill_groups_path, notice: 'Drill group was successfully destroyed.'
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

    def authorize_user!
      unless can?(:manage, @drill_group)
        flash[:alert] = "Access Denied!"
        redirect_to user_student_drill_groups_path(current_user)
      end
    end
end
