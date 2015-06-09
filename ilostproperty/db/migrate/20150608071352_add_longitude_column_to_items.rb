class AddLongitudeColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :longitude, :decimal
  end
end
