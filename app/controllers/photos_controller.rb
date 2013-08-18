class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def new
    @photo = Photo.new
    user = User.find params[:id]
    @photos = user.photos
  end

  def create
    @photo = Photo.new params[:photo]
    @photo.user = User.find params[:id]
    if @photo.save
      redirect_to new_photo_path @photo.user
    else
      render action: :new
    end
  end

  def destroy
    @photo = Photo.find params[:id]
    user = @photo.user
    @photo.destroy
    redirect_to new_photo_path user
  end
end
