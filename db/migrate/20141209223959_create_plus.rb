class CreatePlus < ActiveRecord::Migration
  def change
    create_table :plus do |t|
      t.string :first_name
      t.string :last_name
      t.integer :plus_number

      t.timestamps
    end
  end
end
