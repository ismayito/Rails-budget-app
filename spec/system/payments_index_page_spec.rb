# spec/system/payment_page_spec.rb

require 'rails_helper'

RSpec.describe 'Payment page', type: :system do
   include Devise::Test::IntegrationHelpers # Use Devise helper instead of Warden
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  let(:category) do
    Category.create(name: 'Food', icon: 'food icon', user: user)
  end

  let(:payment) do
    Payment.create(name: 'phone', amount: 1, author: user)
  end

  # mock the current user for the tests if you are unable to sign in
  before do
    # sign the user in the application
    sign_in user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'displays user information and payments' do
    payment.categories << category
    visit category_payments_path(category.id)

    expect(page).to have_content('Payment')
    expect(page).to have_content(user.name)
    expect(page).to have_content("Total:$#{category.total_payments}")

    expect(page).to have_link('Create Payment', href: new_category_payment_path(category.id))
  end

  it 'navigates to the new payment page' do
    payment.categories << category
    visit category_payments_path(category.id)

    click_on 'Create Payment'

    expect(page).to have_content('Create A new payment')
  end
end
