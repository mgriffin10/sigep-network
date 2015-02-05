class RemovePasswordCharacterLimit < ActiveRecord::Migration
  def change
  	change_column :users, :password_digest, :string, :limit => nil
  end
end
