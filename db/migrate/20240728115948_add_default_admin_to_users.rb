class AddDefaultAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :admin, from: nil, to: false
  end
end
