class UpdatesController < ApplicationController

  def new
  end

  def create
    # render text: params[:update].inspect
    # @update = Update.new(params[:update]) # bad because not secure, need to explicitly permit certain fields! 
    @update = Update.new(update_params) 
    @update.save #saves to db.
    redirect_to @update #redirect to show action
  end

  def show
    @update = Update.find(params[:id]) #@ notation means instance variable which will pass to view!
  end

  def index
    @updates = Update.all #active record syntax to get all records!
  end

  private
    def update_params
      params.require(:update).permit(:header, :body); #must match the :update in new.html.erb
    end
end
