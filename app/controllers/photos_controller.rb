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
    render action: :new
  end

  def destroy
    @photo = Photo.find params[:id]
    @photo.destroy
    render action: :new
  end
end
