class SessionsController < ApplicationController
  layout 'layout'
  
  def new
    @user = UserSession.new
  end

  def create
    @user = UserSession.new(params[:user])
    if @user.save
      flash[:notice] = "Login successful."
      redirect_to root_path
    else
      flash[:error] = "Incorrect password. Try again."
      render :new    
    end
  end
  
  def destroy
    session.destroy
  end
end
