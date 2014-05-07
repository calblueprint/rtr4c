class CreateSizeVariants < ActiveRecord::Migration
  def change
    create_table :size_variants do |t|
      t.text :sizes

      t.timestamps
    end
  end
end
