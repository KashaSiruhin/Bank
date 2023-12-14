class AddOwnerToCourse < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :owner, :integer
  end
end
