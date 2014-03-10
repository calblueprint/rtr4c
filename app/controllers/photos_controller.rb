class PhotosController < ApplicationController
  before_filter :load_imageable

  def index
    @photos = @imageable.photos
  end

  # def new
  #   @photo = Photo.new(:gallery_id => params[:gallery_id])
  # end

  # def create
  #   @photo = Photo.new(params[:photo].permit(:name, :image, :gallery_id, :remote_image_url))
  #   if @photo.save
  #     flash[:notice] = "Successfully created photo."
  #     redirect_to @photo.gallery
  #   else
  #     render :action => 'new'
  #   end
  # end

  # def edit
  #   @photo = Photo.find(params[:id])
  # end

  # def update
  #   @photo = Photo.find(params[:id])
  #   if @photo.update_attributes(params[:photo].permit(:name, :image, :gallery_id, :remote_image_url))
  #     flash[:notice] = "Successfully updated photo."
  #     redirect_to @photo.gallery
  #   else
  #     render :action => 'edit'
  #   end
  # end

  # def destroy
  #   @photo = Photo.find(params[:id])
  #   @photo.destroy
  #   flash[:notice] = "Successfully destroyed photo."
  #   redirect_to @photo.gallery
  # end

  private
    def load_imageable
      resource, id = request.path.split('/')[1,2] #ex: /products/1
      @commentable = resource.singularize.classify.constantize.find(id) # Product.find(1)
    end
end
