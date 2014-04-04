class PressUpdatesController < ApplicationController
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
    end
  end


  def destroy
  	@press = PressUpdate.find(params[:id])
  	@press.destroy
  	redirect_to press_updates_path
  end

  def show
  	@press = PressUpdate.find(params[:id])
  end

  def edit
  	@press = PressUpdate.find(params[:id])
  end

  def update
  	@press = PressUpdate.find(params[:id])
  	if @press.update(params[:press].permit(:title, :link, :videolink))
  		redirect_to @press
  	else
  		render 'edit'
  	end
  end

  private
  	def press_params
    	params.require(:press).permit(:title, :link, :videolink)
  	end
end
