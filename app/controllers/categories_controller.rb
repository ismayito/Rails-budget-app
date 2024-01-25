class CategoriesController < ApplicationController
  # Ensure user is signed in
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    if @category.save!
      flash[:success] = 'Category created successfully'
      redirect_to categories_path
    else
      puts '@category.errors.message'
      flash.now[:error] = 'Created not created, check your Entries'
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :amount)
  end
end
