class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :uniqueReference, null: false
      t.integer :amount, null: false
      t.integer :status, default: 0, null: false
      t.integer :transactionType, default: 0, null: false
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end

    add_index :transactions, :uniqueReference, unique: true

  end
end
