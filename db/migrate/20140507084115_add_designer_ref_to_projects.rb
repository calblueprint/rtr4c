class AddDesignerRefToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :designer
  end
end
