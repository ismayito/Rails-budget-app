class Payment < ActiveRecord
  belongs_to :author, class_name: 'User'
  has_many :categories
end
