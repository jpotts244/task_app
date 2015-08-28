class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # direct to profile page
       redirect_to user
    else
      # create error msg
      render new
    end
  end

  def destroy

  end

end