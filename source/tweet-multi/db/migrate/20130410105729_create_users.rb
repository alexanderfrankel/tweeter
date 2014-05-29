class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :twitter_name
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
  end
end
