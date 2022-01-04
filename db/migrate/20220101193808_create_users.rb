class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :password_reset_token
      t.timestamp :password_reset_token_created_at
      t.timestamp :email_verified_at
      t.string :email_verification_token
      
      t.json :links
      
      t.string :locale, default: I18n.default_locale
      t.string :time_zone

      t.timestamps
    end
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
    add_index :users, :password_reset_token
    add_index :users, :email_verification_token
  end
end
