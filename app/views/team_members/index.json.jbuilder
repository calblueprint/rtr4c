json.array!(@team_members) do |team_member|
  json.extract! team_member, :id, :name, :title, :blurb, :role, :portfolio_link
  json.url team_member_url(team_member, format: :json)
end
