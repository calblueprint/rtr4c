class TeamMembersController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  # GET /team_members
  # GET /team_members.json
  def index
    @team_members = TeamMember.all
  end

  # GET /team_members/1
  # GET /team_members/1.json
  def show
  end

  # GET /team_members/new
  def new
    @team_member = TeamMember.new
  end

  # GET /team_members/1/edit
  def edit
  end

  # POST /team_members
  # POST /team_members.json
  def create
    @team_member = TeamMember.new(team_member_params)

    respond_to do |format|
      if @team_member.save
        format.html { redirect_to @team_member, notice: 'Team member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team_member }
      else
        format.html { render action: 'new' }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_members/1
  # PATCH/PUT /team_members/1.json
  def update
    puts "TEAM MEMBER PARAMS"
    puts team_member_params
    puts "CLEANED PARAMS"
    cleaned = nullify_params(team_member_params)
    puts cleaned
    respond_to do |format|
      if @team_member.update(cleaned)
        format.html { redirect_to @team_member, notice: 'Team member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_members/1
  # DELETE /team_members/1.json
  def destroy
    @team_member.destroy
    respond_to do |format|
      format.html { redirect_to team_members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_member_params
      params.require(:team_member).permit(:name, :title, :blurb, :role, :portfolio_link, images_attributes: [:id, :name, :photo, :_destroy])
    end

    #set params to nil where necessary
    def nullify_params(team_params)
      member_role = team_params[:role]
      # only head honcho has images_attributes
      unless member_role == 0
        team_params = nullify_image team_params
      end
      if member_role == 3 # designer
        team_params[:blurb] = nil
      elsif member_role == 4 # volunteer 
        team_params[:blurb] = nil
        team_params[:portfolio_link] = nil
      end
      return team_params
    end

    # param may not contain images_attributes
    def nullify_image(hash)
      if hash.has_key? "images_attributes"
        hash[:images_attributes] = {}
        hash
      end
    end
end
