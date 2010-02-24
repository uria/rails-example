class ContactsController < ApplicationController
  def view
    @params = params
    @user = User.find_by_username(params[:username])
  end

end
