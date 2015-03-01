class CreatePlus < ActiveRecord::Migration
  def change
    create_table :plus do |t|
      t.timestamp :date
      t.boolean :polarity
    end

    add_reference :plus, :user
  end
end
