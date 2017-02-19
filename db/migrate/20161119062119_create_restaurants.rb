class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|

    	t.string :name
    	t.integer :location_id
    	t.integer :mobile
    	t.string :cost_for_two


      t.timestamps null: false
    end
  end
end
