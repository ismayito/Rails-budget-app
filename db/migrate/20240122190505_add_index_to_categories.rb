class AddIndexToCategories < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:categories, :payment_id)
    add_column :categories, :payment_id, :string
  end
end
end
