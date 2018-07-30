class FinancialTransactionsController < ApplicationController
  before_action :set_financial_transaction, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  # GET /transactions
  # GET /transactions.json
  def index
    @financial_transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end
  
  def import
     FinancialTransaction.import(params[:file])
     redirect_to :back, notice: "Transactions imported."
  end

  # GET /transactions/new
  def new
    @financial_transaction = FinancialTransaction.new
    @financial_transaction.user_id = current_user.id
    end

def invoice_entry
    @financial_transaction = FinancialTransaction.new
    @financial_transaction.user_id = current_user.id
    end


  # GET /transactions/1/edit
  def edit
  end



  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = FinancialTransaction.new(financial_transaction_params)
   @financial_transaction.user_id = current_user.id
    respond_to do |format|
      if @financial_transaction.save
        format.html {redirect_to :back, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @financial_transaction }
      else
        format.html { render :new }
        format.json { render json: @financial_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @financial_transaction.update(financial_transaction_params)
        format.html {redirect_to :back, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @financial_transaction }
      else
        format.html { render :edit }
        format.json { render json: @financial_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @financial_transaction.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_transaction
      @financial_transaction = FinancialTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financial_transaction_params
      params.require(:financial_transaction).permit(:user_id, :id, :payment, :payment_entry, :date, :description, :amount, :reference, :bank_account_id, :purchase_id, :sale_id, :total_amount, :bank_id, :account_id, :payment_entry_id, :purchase_invoice_id, :sales_invoice_id, :contact_id, :vat_amount, :vat, :gl_account_id, :vat_type)
    end
end
