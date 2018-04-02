class DrillGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_drill_group, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, except: [:show, :index]

  # GET /drill_groups
  def index
    # get all drill groups
    @drill_groups = DrillGroup.order :level

    # get drill groups by level
    @beginner_drill_groups = DrillGroup.where(level: 1).order(:name)
    @intermediate_drill_groups = DrillGroup.where(level: 2).order(:name)
    @advanced_drill_groups = DrillGroup.where(level: 3).order(:name)

    # for each set, find which ones are already added to 'my drills'
    beginner_exclude = DrillGroup.select('id').joins(:student_drill_groups).where('level = 1 and student_drill_groups.user_id = ?', current_user.id)

    intermediate_exclude = DrillGroup.select('id').joins(:student_drill_groups).where('level = 2 and student_drill_groups.user_id = ?', current_user.id)

    advanced_exclude = DrillGroup.select('id').joins(:student_drill_groups).where('level = 3 and student_drill_groups.user_id = ?', current_user.id)

    # exclude the ones that are already added
    @beginner_drill_groups = @beginner_drill_groups.where.not(id: beginner_exclude)
    @intermediate_drill_groups = @intermediate_drill_groups.where.not(id: intermediate_exclude)
    @advanced_drill_groups = @advanced_drill_groups.where.not(id: advanced_exclude)

    if current_user.is_admin?
      render '/admin/drill_groups/index'
    end
  end

  # GET /drill_groups/1
  def show
    @drill = Drill.new
    1.times  { @drill.solutions.build }

    @drills = @drill_group.drills
    @friendly_level = @drill_group.friendly_level

    if current_user.is_admin?
      render '/admin/drill_groups/show'
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
  def update
    if @drill_group.update(drill_group_params)
      redirect_to @drill_group, notice: 'Drill group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /drill_groups/1
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
