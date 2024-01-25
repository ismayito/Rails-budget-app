class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments

  validates :name, :icon, presence: true

  def total_payments
    payments.joins(:categories).sum(:amount)
  end
end
