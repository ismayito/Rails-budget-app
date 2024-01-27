require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  let(:user) do
    User.create(name: 'mayito ismail', email: 'mayito@example.com', password: 'password')
  end

  let(:payment) do
    Payment.create(name: 'phone', amount: 1, author: user)
  end

  let(:category) do
    Category.create(name: 'Food', icon: 'food icon', user: user)
  end

  before do
    sign_in user
  end

  describe 'GET /payments' do
    it 'returns http success' do
      # Ensure the category is associated with the payment
      payment.categories << category
      get category_payments_path(category.id)
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template of the payments path' do
      payment.categories << category
      get category_payments_path(category.id)
      expect(response).to render_template(:index)
    end
  end

  describe 'NEW/payments' do
    it 'returns http success' do
      get new_category_path
      expect(response).to have_http_status(:success)
    end

    it 'returns new template of the create payment page' do
      payment.categories << category
      get new_category_payment_path(category.id)
      expect(response).to render_template(:new)
    end
  end
end
