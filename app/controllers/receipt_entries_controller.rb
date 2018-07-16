class ReceiptEntriesController < ApplicationController
  before_action :set_receipt_entry, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  # GET /payment_entries
  # GET /payment_entries.json
  def index
    @payment_entries = ReceiptEntry.all.where("user_id =?", current_user.id)
  end

  # GET /payment_entries/1
  # GET /payment_entries/1.json
  def show
  end

  # GET /payment_entries/new
  def new
    @receipt_entry = ReceiptEntry.new
    @receipt_entry.financial_transactions.build
    @receipt_entry.user_id = current_user.id

  end
  
 def invoice_entry
    @receipt_entry = ReceiptEntry.new
    @receipt_entry.financial_transactions.build
    @receipt_entry.user_id = current_user.id
  end
  
  def edit
    
  end

  # POST /payment_entries
  # POST /payment_entries.json
  def create
    @receipt_entry = ReceiptEntry.new(receipt_entry_params)
    @receipt_entry.user_id = current_user.id

    respond_to do |format|
      if @receipt_entry.save
        format.html { redirect_to :back, notice: 'Payment entry was successfully created.' }
        format.json { render :show, status: :created, location: @receipt_entry }
      else
        format.html { render :new }
        format.json { render json: @receipt_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_entries/1
  # PATCH/PUT /payment_entries/1.json
  def update
  
    respond_to do |format|
      if @receipt_entry.update(receipt_entry_params)
        format.html { redirect_to @receipt_entry, notice: 'Payment entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @receipt_entry }
      else
        format.html { render :edit }
        format.json { render json: @@receipt_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_entries/1
  # DELETE /payment_entries/1.json
  def destroy
    @receipt_entry.destroy
    respond_to do |format|
      format.html { redirect_to payment_entries_url, notice: 'Payment entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_entry
      @receipt_entry = ReceiptEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_entry_params
      params.require(:receipt_entry).permit(:financial_transaction_id, :id, financial_transactions_attributes: [:user_id, :financial_transaction, :id, :payment, :date, :description, :purchase_id, :bank_account_id, :total_amount, :amount, :reference, :bank_id, :gl_account_id, :account_id, :purchase_invoice_id, :sale_id, :contact_id, :vat_amount, :vat, :transaction_type, :vat_type, :receipt_entry_id, :_destroy])
    end
end