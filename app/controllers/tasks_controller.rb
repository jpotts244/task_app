class TasksController < ApplicationController
# authentication callback before action, no authentication required to the excepts ones
 # before_action :authenticate, except: [:index]

# GET /tasks
  def index
    if current_user.id
      @user = User.find(current_user.id)
      @tasks = @user.tasks
      @messages = @user.messages
    else
      redirect_to users_path
    end
  end

  def new
    @task = Task.new
    @user = User.new
  end

# GET /tasks/new
  def create
     # for validation for required field if the input is not valid redirect to the create new form, 
     @task = Task.new(task_params)

     if @task.save
        Tasking.create({user_id: current_user.id, task_id: @task.id })
        current_user.id
        flash[:success] = "Task had been saved sucessfully."
        redirect_to current_user

     else
        flash[:danger] = "Task not saved. Required fields are incomplete."
        redirect_to new_task_path
     end
  end

# GET /tasks/:id - show task
  def show
    @task = Task.find(params[:id])
  end

# GET /tasks/:id/edit
  def edit
    @task = Task.find(params[:id])
  end

# POST
  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to current_user
  end

# DELETE /tasks/:id
  def destroy
    # double confirmetion for the delete
    task = Task.find(params[:id])
    task.destroy
    redirect_to current_user
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :duedate, :location, :image)
  end

  # def tasking_params
  #   params.require(:tasking).permit(:user_id, :task_id)
  # end
end
