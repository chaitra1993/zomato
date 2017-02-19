class AddColumnsToMenus < ActiveRecord::Migration
  def change

  	add_column :menus, :menu_type, :string
  end
end
