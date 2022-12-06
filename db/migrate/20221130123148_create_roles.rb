class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :permissions, null: false

      t.timestamps
    end

    add_index :roles, :permissions, unique: true

  end
end
