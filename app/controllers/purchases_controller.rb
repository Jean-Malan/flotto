class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  def index
    @purchases = Purchase.all.where("user_id =?", current_user.id)
    @purchase_entry = PurchaseEntry.all.where("user_id =?", current_user.id)
  end
  
    def paid
    @purchases = Purchase.all.where("user_id =?", current_user.id)
    @purchase_entry = PurchaseEntry.all.where("user_id =?", current_user.id)
    @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end
  
  def unpaid
    @purchases = Purchase.all.where("user_id =?", current_user.id)
   
  end
  
    def partially_paid
    @purchases = Purchase.all.where("user_id =?", current_user.id)
    @purchase_entry = PurchaseEntry.all.where("user_id =?", current_user.id)
    @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
    @purchase_entry = PurchaseEntry.all.where("user_id =?", current_user.id)
    @transactions = FinancialTransaction.all.where("user_id =?", current_user.id)
  end
  
     def draft_index
     @purchases = Purchase..where("user_id =?", current_user.id).where("purchases_type =?", 1)
    @purchase_entry = PurchaseEntry.all.where("user_id =?", current_user.id)
  end
  

  # GET /purchases/new
  def new
    @purchase = Purchase.new
    @purchase.purchase_entries.build
    @purchase.user_id = current_user.id
  end
  
   def invoice
    @purchase = Purchase.new
    @purchase.purchase_entries.build
  end
  
   def draft
    @purchase = Purchase.new
    @purchase.purchase_entries.build
  end
  



  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user_id = current_user.id

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:invoice_number, :contact_id, :date, :notes, :purchases_type, :user_id, :amount, :purchase_id, :id, purchase_entries_attributes: [:id, :product_id, :description, :gl_account_id, :vat_type, :account_id, :quantity, :price, :total_price, :purchase_id, :user_id])
    end
end
