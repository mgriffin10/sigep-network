class AddProfessionalHistoryFields < ActiveRecord::Migration
 
 def up
   	add_column :profiles, :company_name, :string
   	add_column :profiles, :advanced_degrees, :string
   	add_column :profiles, :facebook_link, :string
   	add_column :profiles, :twitter_link, :string
   	add_column :profiles, :linkedin_link, :string
  end

  def down
  	remove_columns :profiles, :linkedin_link, :string
  	remove_columns :profiles, :twitter_link, :string
  	remove_columns :profiles, :facebook_link, :string
    remove_columns :profiles, :advanced_degrees, :string
    remove_columns :profiles, :company_name, :string    
  end
end