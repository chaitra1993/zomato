class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :restaurant_id
      t.string :cuisine_id
      t.integer :price

      t.timestamps null: false
    end
  end
end
