class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :plus_number, :integer, default: 0
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :max_plus_number, :integer, default: 0
  end
end
