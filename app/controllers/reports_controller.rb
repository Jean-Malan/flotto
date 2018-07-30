class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all.where("user_id =?", current_user.id)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end
  
  def income_statement
   @reports = Report.all.where("user_id =?", current_user.id)
   @gl_accounts = GlAccount.all.where("user_id =?", current_user.id)
   @journal_entries = JournalEntry.all.where("user_id =?", current_user.id)
   @purchases = Purchase.all.where("user_id =?", current_user.id)
   @sale = Sale.all.where("user_id =?", current_user.id)
   
   
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
  
  
    def balance_sheet
   @reports = Report.all.where("user_id =?", current_user.id)
   @gl_accounts = GlAccount.all.where("user_id =?", current_user.id)
   @journal_entries = JournalEntry.all.where("user_id =?", current_user.id)
   @purchases = Purchase.all.where("user_id =?", current_user.id)
   @sale = Sale.all.where("user_id =?", current_user.id)
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
