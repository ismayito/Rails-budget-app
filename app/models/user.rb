class User < ActiveRecord
  has_many :categories
  has_many :payments
end
