class AddTrackingToUsers < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :current_sign_in_at, :string
      add_column :users, :last_sign_in_at, :string
  end
end
