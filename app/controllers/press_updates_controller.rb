class PressUpdatesController < ApplicationController

  before_action :authorize

  def new
    @press = PressUpdate.new
  end

  def index
  	@press = PressUpdate.all
  end


  def create
  	@press = PressUpdate.new(press_params)
    if @press.save
      redirect_to press_updates_path(@press)
    else
      flash[:notice] = "failed"
      redirect_to new_press_update_path
    end
  end


  def destroy
  	@press = PressUpdate.find(params[:id])
  	@press.destroy
  	redirect_to press_updates_path
  end

  def show
    @press = PressUpdate.find(params[:id])
    if @press.videolink == nil
      @video_frame = @press.link
    else
      @video_frame = YouTubeAddy.youtube_embed_url(@press.videolink)
    end
  end

  def edit
  	@press = PressUpdate.find(params[:id])
  end

  def update
  	@press = PressUpdate.find(params[:id])
  	if @press.update(params[:pressupdate].permit(:title, :link, :videolink))
  		redirect_to @press
  	else
  		render 'edit'
  	end
  end

  private
  	def press_params
    	params.require(:pressupdate).permit(:title, :link, :videolink)
  	end
end
