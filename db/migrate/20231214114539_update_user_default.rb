class UpdateUserDefault < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :role, :string, default: "User"
  end
end
