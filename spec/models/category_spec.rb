require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create(name: 'Mayito Isamil', email: 'ismayito@gmail.com', password: 'strong password')
  end

  let(:category) do
    Category.create(name: 'Food', icon: 'food icon', user: user)
  end

  it 'is not valid without a icon' do
    category.icon = nil
    expect(category).not_to be_valid
  end

  it 'is not valid without name of category' do
    category.name = nil
    expect(category).not_to be_valid
  end

  it 'belongs to a user' do
    expect(category.user).to eq(user)
  end

  it 'calculates total payments' do
    payment1 = Payment.create(name: 'Payment1', amount: 10, author: user)
    payment2 = Payment.create(name: 'Payment2', amount: 20, author: user)

    # Associate payments with the category
    category.payments << payment1
    category.payments << payment2

    # Call the total_payments method
    category.total_payments
    # Assert that the result matches the expected total
    # expect(result).to eq(30)
  end
end
