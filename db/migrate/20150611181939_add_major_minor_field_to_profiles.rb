class AddMajorMinorFieldToProfiles < ActiveRecord::Migration
 def up
   	add_column :profiles, :college_major_minor, :string
  end

  def down
  	remove_columns :profiles, :college_major_minor, :string 
  end
end
