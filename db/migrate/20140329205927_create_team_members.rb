class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :title
      t.text :blurb
      t.integer :role
      t.string :portfolio_link

      t.timestamps
    end
  end
end
