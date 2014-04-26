class AddVolunteersToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :volunteers, :text
  end
end
