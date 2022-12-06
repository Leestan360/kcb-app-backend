class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.bigint :accountNo, null: false
      t.float :lastKnownBalance, null: false
      t.integer :accountType, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :accounts, :accountNo, unique: true

  end
end
