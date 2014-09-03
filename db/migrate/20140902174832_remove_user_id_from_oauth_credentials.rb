class RemoveUserIdFromOauthCredentials < ActiveRecord::Migration
  def change
    remove_column :oauth_credentials, :user_id, :integer
  end
end
