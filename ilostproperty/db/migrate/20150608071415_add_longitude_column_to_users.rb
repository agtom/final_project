class AddLongitudeColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :decimal
  end
end
