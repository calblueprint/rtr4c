class CreatePressUpdates < ActiveRecord::Migration
  def change
    create_table :press_updates do |t|
      t.string :title
      t.string :link
      t.string :videolink

      t.timestamps
    end
  end
end
