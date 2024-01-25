require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) do
    User.create(name: 'Mayito Isamil', email: 'ismayito@gmail.com', password: 'strong password')
  end

  let(:payment) do
    Payment.create(name: 'Rice', amount: 1, author: user)
  end

  it 'is valid with valid attributes' do
    expect(payment).to be_valid
  end

  it 'is not valid without a name' do
    payment.name = nil
    expect(payment).not_to be_valid
  end

  it 'is not valid without an amount' do
    payment.amount = nil
    expect(payment).not_to be_valid
  end

  it 'is not valid with a non-numeric amount' do
    payment.amount = 'invalid'
    expect(payment).not_to be_valid
  end

  it 'belongs to a user' do
    expect(payment.author).to eq(user)
  end
end
