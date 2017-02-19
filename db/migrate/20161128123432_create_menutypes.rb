class CreateMenutypes < ActiveRecord::Migration
  def change
    create_table :menutypes do |t|

    	t.string :name

      t.timestamps null: false
    end
  end
end
