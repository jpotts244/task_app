class TasksController < ApplicationController
# authentication callback before action, no authentication required to the excepts ones
 # before_action :authenticate, except: [:index]

#GET /tasks

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
    city = @task.location
    city.gsub(" ", "%20")
    # response = HTTParty.get("http://api.wunderground.com/api/4a9cdbbd8fedfdc6/conditions/q/NY/#{city}.json")

    # @weather_feel = response["current_observation"]["feelslike_f"]

    # @weather_condition = response["current_observation"]["weather"]   

    response = HTTParty.get("https://george-vustrey-weather.p.mashape.com/api.php?location=#{city}",
      headers:{
        "X-Mashape-Key" => ENV["WEATHER_KEY"],
        "Accept" => "application/json"
    })
  
    @weather_day = response[1]["day_of_week"]
    @weather_condition = response[0]["condition"]
    @weather_feel = response[2]["high"]

    @users = User.all
    # send out inviation is params[:recipients] exists
    if params[:recipients]
        @recipients = params[:recipients][0].split(",")
        title = "Invitation to join task: "+@task.title
        content = "<p>"+current_user.name+" invites you to join a task, do you accept?<p>"+
                "<a href='/acceptinvite/"+@task.id.to_s+" class='btn btn-success'>Accept</a><br>"  
        @newMessage = Message.create({title: title, content: content, sender_id: current_user.id})
        @recipients.each do |recipient|
          Messaging.create({user:User.find_by_email(recipient),message:@newMessage})
        end
        flash[:success] = "Invitation sent."

        redirect_to current_user
    end   
  end

  def acceptinvite
    Tasking.create({user:current_user,task:Task.find(params[:id])})
    flash[:success] = "Task has been added to your task list."
    redirect_to current_user
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
