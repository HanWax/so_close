class AddColumnToOauthCredential < ActiveRecord::Migration
  def change
    add_column :oauth_credentials, :provider, :string
  end
end
