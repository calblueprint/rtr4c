class CreateBlogposts < ActiveRecord::Migration
  def change
  	drop_table :blogposts
    create_table :blogposts do |t|
      t.string :title
      t.text :post

      t.timestamps
    end
  end
end
