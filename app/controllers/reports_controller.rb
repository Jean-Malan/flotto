class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  # GET /reports
  # GET /reports.json
   def trial_balance
      
      
      @contact_purchase_total = Contact.all.where("user_id =?", current_user.id).sum(:purchase_balance)
      @contact_purchase_balance = Contact.all.where("user_id =?", current_user.id).sum(:purchase_balance)
      
      @bank_accounts = BankAccount.all.where("user_id =?", current_user.id)

      @financial_transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
      @contact_purchase_balance = Contact.all.where("user_id =?", current_user.id).sum(:purchase_balance)
      @vat_balance = VatAccountBalance.where("user_id =?", current_user.id).sum(:vat_amount)
      @contacts_purchase_balance = Contact.all.where("user_id =?", current_user.id).sum(:purchase_balance)
      @contacts_sale_balance = Contact.all.where("user_id =?", current_user.id).sum(:sale_balance)
       
      @gl_accounts = GlAccount.all.where("user_id =?", current_user.id)
    
    
      @income_statement = 0
      @gl_accounts.each do |account|
      if account.account_type == 'operating_expense' || account.account_type == 'cost_of_sales' || account.account_type == 'sales' || account.account_type == 'other_income'
       @income_statement += account.account_balances.sum(:amount).round(2)  
      end
    end 
    
     if params[:start_date] && params[:end_date] 
       start_date = params[:start_date]
       end_date = params[:end_date]
   else 
     
     @gl_accounts = GlAccount.where("user_id =?", current_user.id)
    end 
  end 


  def show
  end
  
def income_statement
 @gl_accounts = GlAccount.all.where("user_id =?", current_user.id)
   if params[:start_date] && params[:end_date] 
       start_date = params[:start_date]
       end_date = params[:end_date]
   else 
     @gl_accounts = GlAccount.where("user_id =?", current_user.id)
    end 
  end
   
   

   def customer_balance
    @sales = Sale.where("user_id =?", current_user.id).where("sales_type =?", 'invoice')
    @customer = Contact.where("user_id =?", current_user.id)
    @transactions = FinancialTransaction.where("user_id =?", current_user.id)
    @sales30 = Sale.all.where("user_id =?", current_user.id).where("sales_type =?", 0).where("balance <= ?", 0).where(:due_date => 30.days.ago..Time.now)
    @sales60 = Sale.where("user_id =?", current_user.id).where("sales_type =?", 0).where("balance <= ?", 0).where(:due_date => 60.days.ago..3.months.ago)
    @sales90 = Sale.where("user_id =?", current_user.id).where("sales_type =?", 0).where("balance <= ?", 0).where(:due_date => 90.days.ago..6.months.ago)
    @sales120 = Sale.where("user_id =?", current_user.id).where("sales_type =?", 0).where("balance <= ?", 0).where(:due_date => 120.days.ago..90.months.ago)
  end 
  
   def supplier_balance
    @purchases = Purchase.where("user_id =?", current_user.id).where("sales_type =?", 'invoice')
    @customer = Contact.where("user_id =?", current_user.id)
    @transactions = FinancialTransaction.where("user_id =?", current_user.id)
    @purchases30 = Purchase.all.where("user_id =?", current_user.id).where("purchases_type =?", 0).where(:date => 3.months.ago..Time.now)
    @purchases60 = Purchase.all.where("user_id =?", current_user.id).where("purchases_type =?", 0).where(:date => 6.months.ago..3.months.ago)
    @purchases90 = Purchase.all.where("user_id =?", current_user.id).where("purchases_type =?", 0).where(:date => 9.months.ago..6.months.ago)
    @purchases120 = Purchase.all.where("user_id =?", current_user.id).where("purchases_type =?", 0).where(:date => 12.months.ago..9.months.ago)

  end 
  
   def vat_report
    @vat_control = VatAccountBalance.where("user_id =?", current_user.id).where("date BETWEEN ? AND ?", params[:start_date], params[:end_date])
     if params[:start_date] && params[:end_date] 
       start_date = params[:start_date]
       end_date = params[:end_date]
   else 
     @vat_control = VatAccountBalance.where("user_id =?", current_user.id)
    end 

  end 
  
  
    def balance_sheet
      
      
      @contact_purchase_total = Contact.all.where("user_id =?", current_user.id).sum(:purchase_balance)
      @contact_purchase_balance = Contact.all.where("user_id =?", current_user.id).sum(:purchase_balance)
      
      @bank_accounts = BankAccount.all.where("user_id =?", current_user.id)

      @financial_transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
      @contact_purchase_balance = Contact.all.where("user_id =?", current_user.id).sum(:purchase_balance)
      @vat_balance = VatAccountBalance.where("user_id =?", current_user.id).sum(:vat_amount)
      @contacts = Contact.all.where("user_id =?", current_user.id)
      @gl_accounts = GlAccount.all.where("user_id =?", current_user.id)
    
    
      @income_statement = 0
      @gl_accounts.each do |account|
      if account.account_type == 'operating_expense' || account.account_type == 'cost_of_sales' || account.account_type == 'sales' || account.account_type == 'other_income'
       @income_statement += account.account_balances.sum(:amount).round(2)  
      end
    end 
    
     if params[:start_date] && params[:end_date] 
       start_date = params[:start_date]
       end_date = params[:end_date]
   else 
     
     @gl_accounts = GlAccount.where("user_id =?", current_user.id)
    end 
  end 
  
  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.fetch(:report, {})
    end
end
