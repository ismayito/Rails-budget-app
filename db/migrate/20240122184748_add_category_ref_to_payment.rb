class AddCategoryRefToPayment < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :category, null: false, foreign_key: true
  end
end