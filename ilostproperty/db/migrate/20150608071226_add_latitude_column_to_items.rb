class AddLatitudeColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :latitude, :decimal
  end
end
