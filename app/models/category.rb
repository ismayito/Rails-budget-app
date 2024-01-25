class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments

  validates :name, :icon, presence: true
  validates :name, :icon, format: { with: /\A[a-zA-Z]+\z/,
                                    message: 'only allows letters' }

  def total_payments
    payments.joins(:categories).sum(:amount)
  end
end
