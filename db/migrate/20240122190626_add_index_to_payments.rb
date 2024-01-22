class AddIndexToPayments < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:payments, :author_id)
    add_column :payments, :category_id, :string
  end
end
end
