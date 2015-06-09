class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :location_lost
      t.integer :reward
      t.integer :user_id
      t.boolean :found

      t.timestamps null: false
    end
  end
end
