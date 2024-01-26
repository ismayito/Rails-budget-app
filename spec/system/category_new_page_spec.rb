require 'rails_helper'

RSpec.describe 'New category page', type: :system do
   include Devise::Test::IntegrationHelpers # Use Devise helper instead of Warden
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  let(:category) do
    Category.create(name: 'Food', icon: 'food icon', user: user)
  end

  let(:payment) do
    Payment.create(name: 'phone', amount: 1, author: user)
  end


  before do
    # Log in the user or perform any necessary setup
    sign_in user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'creating a new category' do
    visit new_category_path
    fill_in "Category name:", with: "it Category"
    fill_in "Link of category icon", with: "https://www.example.com/icon.png"
    click_on "Create category"
  end

  it 'navigation back to categories' do
    visit new_category_path
  end
end
