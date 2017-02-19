class AddColumnsToMenusMenutypeId < ActiveRecord::Migration
  def change

  	add_column :menus, :menutype_id, :integer
  end
end
