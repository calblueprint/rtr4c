class PhotosController < ApplicationController
  def new
    @photo = Photo.new(:gallery_id => params[:gallery_id])
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to @photo.gallery
    else
      render :action => 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to @photo.gallery
    else
      render :action => 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to @photo.gallery
  end
end
