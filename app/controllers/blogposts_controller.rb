class BlogpostsController < ApplicationController
  def index
  	@blogpost = Blogpost.all
  end

  def new
  	@blogpost = Blogpost.new
  end

  def create
  	@blogpost = Blogpost.new(blogpost_params)

    respond_to do |format|
      if @blogpost.save
        format.html { redirect_to @blogpost, notice: 'Blogpost was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blogpost }
      else
        format.html { render action: 'new' }
        format.json { render json: @blogpost.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  	@blogpost = Blogpost.find(params[:id])
  end

  def update
  	@blogpost = Blogpost.find(params[:id])

  	if @blogpost.update(blogpost_params)
  		redirect_to blogpost_path(@blogpost)
  	else
  		redirect_to edit_blogpost_path(@blogpost)
  	end
  end


  def show
  	@blogpost = Blogpost.find(params[:id])
  end

  def destroy
  	@blogpost = Blogpost.find(params[:id])
  	@blogpost.destroy
  	redirect_to blogposts_path
  end

  private
  	def blogpost_params
  		params.require(:blogpost).permit(:title, :post, images_attributes: [:id, :name, :photo, :_destroy])
  	end

end
