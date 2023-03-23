class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /payments or /payments.json
  def index
    @category = current_user.categories.find_by(id: params[:category_id])
    # @categories = Category.find(params[:category_id])

    @payments = @category.payments.order(created_at: :desc)
    puts "This is the #{@payments}"

    @total = @payments.sum(:amount)
  end

  # GET /payments/1 or /payments/1.json
  def show
    @categories = Category.find_by(id: params[:category_id])
    @payment = Payment.find(params[:id])
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments or /payments.json
  def create
    @category = current_user.id
    @payment = current_user.payments.build(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to category_path(@category), notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, :author_id)
  end
end
