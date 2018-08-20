class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  # GET /bank_accounts
  # GET /bank_accounts.json
  def index
    @bank_account = BankAccount.new
    @bank_account.user_id = current_user.id
    @bank_accounts = BankAccount.where("user_id =?", current_user.id)
    @financial_transactions = FinancialTransaction.where("user_id =?", current_user.id)
  end
  

  # GET /bank_accounts/1
  # GET /bank_accounts/1.json
  def show
    @total = FinancialTransaction.all.where("user_id =?", current_user.id)
    @financial_transactions = FinancialTransaction.all.where("user_id =?", current_user.id).order('date DESC').paginate(:per_page => 100, :page => params[:page])
   # @search = FinancialTransactionSearch.new(params[:search])
   # @financial_transactions = @search.scope.where("user_id =?", current_user.id).searchref(params[:searchref]).order('date DESC').paginate(:per_page => 100, :page => params[:page])
  end
  
  
  def unallocated
    @bank_accounts = BankAccount.all.where("user_id =?", current_user.id)
    @financial_transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end
  
  
  def import
     FinancialTransaction.import(params[:file])
     redirect_to :back, notice: "Transactions imported."
  end
  
 
  # GET /bank_accounts/new
  def new
    @bank_account = BankAccount.new
    @bank_account.user_id = current_user.id
  end

def destroy_multiple

  FinancialTransaction.destroy(params[:transactions])

  respond_to do |format|
    format.html { redirect_to blog_posts_path }
    format.json { head :no_content }
  end

end

  # GET /bank_accounts/1/edit
  def edit
  end

  # POST /bank_accounts
  # POST /bank_accounts.json
  def create
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.user_id = current_user.id
    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to @bank_account, notice: 'Bank account was successfully created.' }
        format.json { render :show, status: :created, location: @bank_account }
      else
        format.html { render :new }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_accounts/1
  # PATCH/PUT /bank_accounts/1.json
  def update
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html { redirect_to redirect_to :back, notice: 'Bank account was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_accounts/1
  # DELETE /bank_accounts/1.json
  def destroy
    @bank_account.destroy
    respond_to do |format|
      format.html { redirect_to bank_accounts_url, notice: 'Bank account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_account_params
      params.require(:bank_account).permit(:code, :name, :opening_balance, :user_id)
    end
    
      private

end
