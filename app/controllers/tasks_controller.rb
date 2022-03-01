class TasksController < ApplicationController
  before_action :authenticate_account!
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = @category.tasks
  end

  # GET /tasks/1
  def show
    @tasks = @category.tasks
  end

  # GET /tasks/new
  def new
    @task = @category.tasks.build
  end

  # GET /tasks/1/edit
  def edit
    @tasks = @category.tasks
  end

  # POST /tasks
  def create
    @task = @category.tasks.build(task_params)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @category.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :body, :category_id)
    end

    def set_category
      @category = current_account.categories.find_by(params[:category_id])
    end
    
end
