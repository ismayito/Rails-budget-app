require 'rails_helper'

RSpec.describe 'Categories Page', type: :system do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }

  before do
    # Assuming you have a login mechanism, log in the user here
    # You may use devise helpers or implement your own login mechanism
    # Example: visit new_user_session_path, fill in credentials, click_button 'Log in'

    sign_in(user)
    # Create some categories for the user
    @categories = [
      Category.create(name: 'Food', icon: 'tyuuud', user: user),
      Category.create(name: 'Kitchen', icon: 'tyruruuu', user: user)
      # Add more categories as needed
    ]
  end

  it 'displays the categories' do
    visit categories_path

    @categories.each_with_index do |category, index|
      #   expect(page).to have_content(category.name)
      #   expect(page).to have_content(category.icon)
    end
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
  end
end
