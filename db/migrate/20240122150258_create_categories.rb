class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.integer :payment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
