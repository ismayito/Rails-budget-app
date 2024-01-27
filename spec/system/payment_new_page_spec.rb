# spec/system/payment_creation_page_spec.rb

require 'rails_helper'

RSpec.describe 'Payment creation page', type: :system do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  let(:category) do
    Category.create(name: 'Food', icon: 'food icon', user: user)
  end

  # mock the current user for the tests if you are unable to sign in
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'displays the payment creation form' do
    visit new_category_payment_path(category)

    expect(page).to have_text('Create A new payment')

    within 'form' do
      expect(page).to have_select('payment_category_id', with_options: ['select a category', 'Food'])
      expect(page).to have_field('Payment name:')
      expect(page).to have_field('Amount')
      expect(page).to have_button('Submit')
    end
  end

  it 'creates a new payment' do
    visit new_category_payment_path(category)

    within 'form' do
      select 'Food', from: 'payment_category_id'
      fill_in 'Payment name:', with: 'Dinner'
      fill_in 'Amount', with: '$20'
      click_button 'Submit'
    end
  end
end
