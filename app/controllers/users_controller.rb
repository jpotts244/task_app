class UsersController < ApplicationController
 before_action :authenticate, except: [:index,:new,:create]
	def index
		@users = User.all
	end

	def new
  	@user = User.new
	end

	def create
		@user = User.create(user_params)
  		if @user.save
  				session[:user_id] = @user.id
	  			redirect_to  @user
	  			else
					render template: "sessions/new"
					render new
  		end
  	end
  	
  def show
  	@user = User.find(params[:id])
  	@tasks = @user.tasks
  	@messages = @user.messages
  end
  

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end


end




