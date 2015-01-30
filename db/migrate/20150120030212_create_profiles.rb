class CreateProfiles < ActiveRecord::Migration
  
  def change
    create_table :profiles do |t|
		t.references :user
		t.string "first_name", :limit => 25
    	t.string "last_name", :limit => 25
    	t.integer "class_year", :limit => 4
    	t.string "residence_state", :limit => 2
    	t.string "residence_city", :limit => 20
    	t.string "residence_country", :limit => 20
    	t.string "industry", :limit => 25 
    	t.string "email", :default => "", :null => false
    	t.timestamps null: false
    end
    add_index("profiles", "user_id")
  end
end
