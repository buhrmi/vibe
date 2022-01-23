class AddDisplayNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :display_name, :string
    enable_extension :citext
    change_column :users, :email, :citext
    change_column :users, :name, :citext
  end
end
