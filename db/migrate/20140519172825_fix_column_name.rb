class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :images, :name, :phototype
  end
end
