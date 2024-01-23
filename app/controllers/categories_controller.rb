class CategoriesController < ApplicationController
  before_action :require_login, only: [:index]
  def index; end

  def new; end

  def create; end

  private

  def require_login
    redirect_to categories_path unless user_signed_in? || request.path == categories_path
  end
end
