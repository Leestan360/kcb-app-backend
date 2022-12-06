class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :uid, null: false
      t.string :deviceType, null: false
      t.datetime :lastSeen, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :devices, :uid, unique: true

  end
end