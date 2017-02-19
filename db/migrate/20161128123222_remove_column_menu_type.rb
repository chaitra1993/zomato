class RemoveColumnMenuType < ActiveRecord::Migration
  def change

  	remove_column :menus, :menu_type
  end
end
