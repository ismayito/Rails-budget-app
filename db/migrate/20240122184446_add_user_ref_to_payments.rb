class AddUserRefToPayments < ActiveRecord::Migration[7.1]
  def change
    add_reference :payments, :user, null: false, foreign_key: true unless foreign_key_exists?(:payments, :users)
  end
end
