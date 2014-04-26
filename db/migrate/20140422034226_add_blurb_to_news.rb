class AddBlurbToNews < ActiveRecord::Migration
  def change
    add_column :press_updates, :blurb, :text
  end
end
