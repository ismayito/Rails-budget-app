class AddPaymentRefToCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :payment_id if column_exists?(:categories, :payment_id)
    add_reference :categories, :payment, null: false, foreign_key: true
  end
end
