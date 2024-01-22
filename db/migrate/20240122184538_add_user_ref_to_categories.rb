class AddUserRefToCategories < ActiveRecord::Migration[7.1]
  def change
   remove_column :categories, :user_id if column_exists?(:categories, :user_id)
   add_reference :categories, :user, null: false, foreign_key: true
  end
end
