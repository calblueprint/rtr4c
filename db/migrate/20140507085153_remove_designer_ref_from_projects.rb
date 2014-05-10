class RemoveDesignerRefFromProjects < ActiveRecord::Migration
  def change
    remove_reference :projects, :designer
  end
end
