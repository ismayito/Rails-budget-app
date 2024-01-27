require 'rails_helper'

RSpec.describe 'Categories Page', type: :system do
  include Warden::Test::Helpers
  include Devise::Test::IntegrationHelpers # Use Devise helper instead of Warden
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  before do
    # Assuming you have a login mechanism, log in the user here
    # You may use devise helpers or implement your own login mechanism
    # Example: visit new_user_session_path, fill in credentials, click_button 'Log in'

    sign_in user
    # Create some categories for the user
    @categories = [
      Category.create(name: 'Food', icon: 'tyuuud', user: user),
      Category.create(name: 'Kitchen', icon: 'tyruruuu', user: user)
      # Add more categories as needed
    ]
  end

  it 'displays the categories' do
    visit categories_path

    @categories.each_with_index do |category, _index|
      expect(page).to have_content(category.name)
    end
  end
end
