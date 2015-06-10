class AddUserRoles < ActiveRecord::Migration
def up
   	add_column :users, :role, :string
  end

  def down
  	remove_columns :users, :role, :string
  end
end
