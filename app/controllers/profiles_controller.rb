class ProfilesController < ApplicationController
  layout 'layout'
  
  before_filter :logged_in_filter
  
  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Profile updated."
      redirect_to contact_path(current_user.username)
    else
      render :edit
    end
  end
end
