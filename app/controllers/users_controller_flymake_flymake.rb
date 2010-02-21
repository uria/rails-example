class UsersController < ApplicationController
  layout 'layout'
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #If succesful login user and redirect to profile edit
      UserSession.create(@user, true)
      flash[:notice] = "Registration successful."
      redirect_to edit_profile_path
    else
      render :new
    end
  end

end
