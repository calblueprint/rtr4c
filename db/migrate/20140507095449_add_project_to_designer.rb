class AddProjectToDesigner < ActiveRecord::Migration
  def change
    add_column :designers, :project_id, :integer
  end
end
