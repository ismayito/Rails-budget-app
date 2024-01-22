class Category < ActiveRecord
  belongs_to :user
  has_many :payments
end
