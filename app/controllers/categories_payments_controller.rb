class CategoriesPaymentsController < ApplicationController
    def show
        @category = Category.find(params[:category_id])
        @payment = Payment.find(params[:id])
        @transactions = @category.transactions.where(payment_id: @payment.id)
        @total = @transactions.sum(:amount)
    end
end
