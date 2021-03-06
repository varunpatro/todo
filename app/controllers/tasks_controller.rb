class TasksController < ApplicationController
  include TasksHelper
  before_action :valid_auth
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def search
  end

  def search_results
    @tasks = search_helper(params.permit(:tagSearch, :tag, :isDone, :isStarred, :isArchived))
    render :layout => false
  end

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(isArchived: false)
    @task = Task.new
    @lists = List.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    redirect_to @task.list
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @lists = List.all
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create

    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        create_multiple_tags(task_params["tag"], @task.id)

        format.html { redirect_to @task.list, notice: "Task successfully created" }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.tags.each { |t| t.delete}

    respond_to do |format|
      if @task.update(task_params)
        create_multiple_tags(task_params["tag"], @task.id)

        format.html { redirect_to @task.list, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
      if @task.list.user_id != @user.id
        redirect_to tasks_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :list_id, :tag, :isStarred, :isDone, :isArchived)
    end

    def valid_auth
      if session[:logged_in?]
        @user = User.find(session[:user_id])
      else
        redirect_to users_login_path, notice: "You must login to access your tasks."
      end
    end

end
