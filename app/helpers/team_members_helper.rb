module TeamMembersHelper
  def get_role(id)
   if params[:action] == 'edit'
    TeamMember.find(id).role
  else
    nil
  end
  end
end
