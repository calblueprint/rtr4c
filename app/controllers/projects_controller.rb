class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    @project_array = @projects.sort_by! {|a| a.created_at}
    @featured_array = @project_array[0..2]
    @featured_one = @featured_array[0]
    @featured_two = @featured_array[1]
    @featured_three = @featured_array[2]
    @rest_array = @project_array[3..@project_array.length]
    @paginated_projects = @rest_array.paginate(:page => params[:page], :per_page => 6)
  end


  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    redirect_to projects_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :date, :description, :location, images_attributes: [:id, :name, :photo, :_destroy])
    end
end
