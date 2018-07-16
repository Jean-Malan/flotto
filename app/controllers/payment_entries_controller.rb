class PaymentEntriesController < ApplicationController
  before_action :set_payment_entry, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  # GET /payment_entries
  # GET /payment_entries.json
  def index
    @payment_entries = PaymentEntry.all.where("user_id =?", current_user.id)
  end

  # GET /payment_entries/1
  # GET /payment_entries/1.json
  def show
  end

  # GET /payment_entries/new
  def new
    @payment_entry = PaymentEntry.new
    @payment_entry.financial_transactions.build
    @payment_entry.user_id = current_user.id

  end
  
 def invoice_entry
    @payment_entry = PaymentEntry.new
    @payment_entry.financial_transactions.build
  end
  
  # GET /payment_entries/1/edit
  def edit
    
  end

  # POST /payment_entries
  # POST /payment_entries.json
  def create
    @payment_entry = PaymentEntry.new(payment_entry_params)
    @payment_entry.user_id = current_user.id

    respond_to do |format|
      if @payment_entry.save
        format.html { redirect_to :back, notice: 'Payment entry was successfully created.' }
        format.json { render :show, status: :created, location: @payment_entry }
      else
        format.html { render :new }
        format.json { render json: @payment_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_entries/1
  # PATCH/PUT /payment_entries/1.json
  def update
  
    respond_to do |format|
      if @payment_entry.update(payment_entry_params)
        format.html { redirect_to @payment_entry, notice: 'Payment entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_entry }
      else
        format.html { render :edit }
        format.json { render json: @payment_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_entries/1
  # DELETE /payment_entries/1.json
  def destroy
    @payment_entry.destroy
    respond_to do |format|
      format.html { redirect_to payment_entries_url, notice: 'Payment entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_entry
      @payment_entry = PaymentEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_entry_params
      params.require(:payment_entry).permit(:financial_transaction_id, :id, financial_transactions_attributes: [:user_id, :financial_transaction_id, :id, :payment, :date, :description, :purchase_id, :bank_account_id, :total_amount, :amount, :reference, :bank_id, :gl_account_id, :account_id, :purchase_invoice_id, :sales_invoice_id, :contact_id, :vat_amount, :vat, :transaction_type, :vat_type, :payment_entry_id, :_destroy])
    end
end