class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories

  validates :name, :amount, presence: true
  validates :amount, numericality: true
end
