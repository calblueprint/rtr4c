class AddPhotoToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :photo
  end
end
