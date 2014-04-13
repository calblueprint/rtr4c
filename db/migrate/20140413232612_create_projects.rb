class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.datetime :date
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
