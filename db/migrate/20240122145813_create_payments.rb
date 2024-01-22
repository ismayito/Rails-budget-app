class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.decimal :amount
      t.integer :author_id
      t.integer :category_id

      t.timestamps
    end
  end
end
