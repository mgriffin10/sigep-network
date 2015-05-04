class AddProfileFields < ActiveRecord::Migration

  def up
   	add_column :profiles, :career_details, :string
   	add_column :profiles, :bio, :string
  end

  def down
    remove_columns :profiles, :career_details, :string
    remove_columns :profiles, :bio, :string    
  end
end
