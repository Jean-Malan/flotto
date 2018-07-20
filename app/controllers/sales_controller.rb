class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  def index
     @sale = Sale.new
    @sale.sales_entries.build
    @sale.user_id = current_user.id
    @sales = Sale.all.where("user_id =?", current_user.id)
    @sale_entry = SalesEntry.all.where("user_id =?", current_user.id)
  end
  
    def partially_paid
    @sales = Sale.all.where("user_id =?", current_user.id)
    @sale_entry = SalesEntry.all.where("user_id =?", current_user.id)
      @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end
  
    def paid
    @sales = Sale.all.where("user_id =?", current_user.id)
    @sale_entry = SalesEntry.all.where("user_id =?", current_user.id)
     @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end
  
      def unpaid
    @sales = Sale.all.where("user_id =?", current_user.id)
    @sale_entry = SalesEntry.all.where("user_id =?", current_user.id)
     @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end
  
  
  def show
   @sale_entry = SalesEntry.all.where("user_id =?", current_user.id)
   @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end
  
      def draft_index
    @sales = Sale.all.where("sales_type =?", 1).where("user_id =?", current_user.id)
    @sale_entry = SalesEntry.all.where("user_id =?", current_user.id)
  end


  def new
    @sale = Sale.new
    @sale.sales_entries.build
    @sale.user_id = current_user.id
  end
  
   def invoice
    @sale = Sale.new
    @sale.sales_entries.build
    @sale.user_id = current_user.id
    end

  
  def quote
    @sale = Sale.new
    @sale.sales_entries.build
end

  
    def draft
    @sale = Sale.new
    @sale.sales_entries.build
  end


  # GET /sales/1/edit
  def edit

  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.balance = 0
    @sale.user_id = current_user.id
    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:id, :invoice_number, :number, :title, :address, :date, :due_date, :vat_total, :balance, :amount, :notes, :customer_id, :account_type, :sales_type, :contact_id, :user_id, sales_entries_attributes: [:user_id, :id, :sale_id, :invoice_number, :product_id, :description, :vat_amount, :quantity, :price, :vat_type, :account_id, :total_price, :gl_account_id ])
    end
end
