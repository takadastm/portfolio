class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal
  #before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :sort]

  # GET /todos
  #def index
  #  @todos = Todo.all
  #end

  # GET /todos/1
  #def show
  #end

  # GET /todos/new
  def new
    #@todo = Todo.new
    @todo = @goal.todos.new
  end

  # GET /todos/1/edit
  def edit
  end
  
  # GET /todos/sort
  def sort
  end

  # POST /todos
  def create
    #@todo = Todo.new(todo_params)
    @todo = @goal.todos.new(todo_params)
    if @todo.save
      #redirect_to @todo, notice: 'Todo was successfully created.'
      @status = true
    else
      #render :new
      @status = false
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      #redirect_to @todo, notice: 'Todo was successfully updated.'
      @status = true
    else
      #render :edit
      @status = false
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    #redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    def set_goal
      @goal = current_user.goals.find_by(id: params[:goal_id])
      redirect_to(goals_url, alert: "ERROR!!") if @goal.blank?
    end
  
    def set_todo
      #@todo = Todo.find(params[:id])
      @todo = @goals.todos.find_by(id: params[:id])
    end

    def todo_params
      params.require(:todo).permit(:content, :goal_id, :position, :done, tag_ids: [])
    end
end
