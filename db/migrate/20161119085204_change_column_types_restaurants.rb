class ChangeColumnTypesRestaurants < ActiveRecord::Migration
  def change

  	change_column :restaurants, :mobile, :string
  end
end
