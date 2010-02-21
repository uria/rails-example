class ProfilesController < ApplicationController
  layout 'layout'
  
  before_filter :logged_in
  
  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Profile updated."
      redirect_to root_path
    else
      render :edit
    end
  end
  
  private
  
  def logged_in
    unless current_user
      flash[:error] = "Access denied."
      redirect_to root_path 
    end
  end
end
