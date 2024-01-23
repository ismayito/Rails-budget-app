class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories
end
