class PaymentsController < ApplicationController
  before_action :set_category

  def index
    @payments = @category.payments.order(created_at: :desc).all
  end

  def create
    @payment = Payment.includes(:category, :user).new(payment_params)
    @payment.author = current_user
    @category = Category.find(params[:payment][:category_id])

    if @payment.save!
      @payment.categories << @category
      flash[:success] = 'Your payment was successfully created.'
      redirect_to category_payments_path
    else
      flash.now[:error] = 'An error occurred check your entries'
      render :new
    end
  end

  def new
    @payment = Payment.new
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :name)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
