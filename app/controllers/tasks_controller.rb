class TasksController < ApplicationController
  before_action :authenticate_account!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @categories = current_account.categories
    category_id = params[:category_id]

    if !category_id.nil?
      @tasks = Task.where(:category_id => category_id)
    else
      @tasks = current_account.tasks
    end
    
  end

  # GET /tasks/1
  def show
    @tasks = current_account.tasks
  end

  # GET /tasks/new
  def new
    @task = current_account.tasks.build
  end

  # GET /tasks/1/edit
  def edit
    @tasks = current_account.tasks
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  def update_status
    @tasks = current_account.tasks.find(params[:id])
    @tasks.update(status: params[:status])
    redirect_to :tasks, notice: "#{@tasks.title} changed status to #{@tasks.status}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_account.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :body, :date, :category_id)
    end
end
