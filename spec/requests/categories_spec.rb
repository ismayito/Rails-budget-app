require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) do
    User.create(name: 'mayito ismail', email: 'mayito@example.com', password: 'password')
  end

  let(:category) do
    Category.create(name: 'Electronics', icon: 'wrtttttttttttttttttttttttttttttttt', user: user)
  end

  before do
    sign_in user
  end

  describe 'GET /categories' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template of the categories path' do
      get categories_path
      expect(response).to render_template(:index)
    end
  end

  describe 'NEW/categories' do
    it 'returns http success' do
      get new_category_path
      expect(response).to have_http_status(:success)
    end

    it 'returns new template of the create category page' do
      get new_category_path
      expect(response).to render_template(:new)
    end
  end
end
