class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  def index
    #@goals = Goal.all
    @goals = current_user.goals.all
  end

  # GET /goals/1
  #def show
  #end

  # GET /goals/new
  def new
    #@goal = Goal.new
    @goal = current_user.goals.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  def create
    #@goal = Goal.new(goal_params)
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      #redirect_to @goal, notice: 'Goal was successfully created.'
      @status = true
    else
      #render :new
      @status = false
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      #redirect_to @goal, notice: 'Goal was successfully updated.'
      @status = true
    else
      #render :edit
      @status =false
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
    #redirect_to goals_url, notice: 'Goal was successfully destroyed.'
  end

  private
    def set_goal
      #@goal = Goal.find(params[:id])
      @goal = current_user.goals.find_by(params[:id])
      redirect_to(goals_url, alert: "ERROR!!")
    end

    def goal_params
      params.require(:goal).permit(:title, :user_id)
    end
end
