class AddUserIdToOauthCredentials < ActiveRecord::Migration
  def change
    add_column :oauth_credentials, :user_id, :integer
  end
end
