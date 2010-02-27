class PhotosController < ApplicationController
  layout 'layout'
  
  before_filter :logged_in_filter
  before_filter :not_full, :only => [:new, :create]
  
  def index
    @photos = current_user.photos.find(:all)
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    @photo.user = current_user
    if @photo.save
      flash[:notice] = "Photo uploaded."
      redirect_to photos_path
    else
      render :new
    end
  end

  def destroy
    if current_user.delete_photo(params[:id])
      flash[:notice] = "Photo deleted."
      redirect_to :photos
    else
      flash[:error] = "Access denied."      
      redirect_to :back
    end
  end
  
  private
  
  #A user cannot have more than 10 photos
  def not_full
    redirect_to root_path if current_user.photos.size >= 10
  end
end
