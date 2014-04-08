class TeamMembersController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  def index
    @team_members      = TeamMember.all
    @head_honchos      = @team_members.where(role: 0)
    @advisory_board    = @team_members.where(role: 1)
    @young_ambassadors = @team_members.where(role: 2)
    @designers         = @team_members.where(role: 3)
    @volunteers        = @team_members.where(role: 4)
  end

  def show
  end

  def new
    @team_member = TeamMember.new
  end

  def edit
  end

  def create
    @team_member = TeamMember.new(nullify_params team_member_params)
    if @team_member.save
      redirect_to @team_member, notice: 'Team member was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @team_member.update(nullify_params team_member_params)
      redirect_to @team_member, notice: 'Team member was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @team_member.destroy
    redirect_to team_members_url
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
      # puts "team params we're going to clean up!"
      # puts team_params
      # puts "team params blurb is:"
      # puts team_params["blurb"].empty?
      # member_role = team_params[:role].to_i
      # # only head honcho has images_attributes
      # unless member_role == 0
      #   team_params = nullify_image team_params
      # end
      # if member_role == 3 # designer
      #   team_params["blurb"] = nil
      # elsif member_role == 4 # volunteer 
      #   team_params["blurb"] = nil
      #   team_params[:portfolio_link] = nil
      # end
      # @cleaned_params = team_params
      team_params
    end

    # param may not contain images_attributes
    def nullify_image(hash)
      if hash.has_key? "images_attributes"
        hash[:images_attributes] = {}
        hash
      end
    end
end
