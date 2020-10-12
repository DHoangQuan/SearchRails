class AddMissingColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sign_in_count, :integer
    
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :last_sign_in_ip, :inet
    add_column :users, :current_sign_in_ip, :inet
    add_column :users, :role, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
