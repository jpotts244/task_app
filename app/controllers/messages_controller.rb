class MessagesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@messages = @user.messages
	end

	def new
		# @user = User.search(params[:search])
		@user = User.find(params[:user_id])
		@message = Message.new
	end

	def create
		# binding.pry
		# @user = User.find(params[:user_id])
		#user_id refers to the recipient id 
		@message = Message.new(message_params) 
		if @message.save
			# if successfully save
			Message.create(message_params)
			redirect_to user_messages_path
		else
			# otherwise go back to new msg page
			flash[:danger] = "Please Complete Content Input"
			redirect_to new_user_message_path
		end
		
	end

	def show
		@user = User.find(params[:user_id])
		@message = Message.find(params[:id])
		@sender = Message.find(params[:id]).sender_id
		@sender_name = User.find(id = @sender).name
	end

	def destroy
		@message = Message.find(params[:id])
		@message.delete
		redirect_to user_messages_path
	end

	private
	def message_params
		#Dont panic if this doesnt work, it good, you need to be signed in! 
		params
		.require(:message)
		.permit(:user_id, :content, :attachment, :sender_id)
		.merge({sender_id: current_user.id})
	end

end