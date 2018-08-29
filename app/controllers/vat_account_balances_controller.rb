class VatAccountBalancesController < ApplicationController
  before_action :set_vat_account_balance, only: [:show, :edit, :update, :destroy]

  # GET /vat_account_balances
  # GET /vat_account_balances.json
  def index
    @vat_account_balances = VatAccountBalance.all
  end

  # GET /vat_account_balances/1
  # GET /vat_account_balances/1.json
  def show
  end

  # GET /vat_account_balances/new
  def new
    @vat_account_balance = VatAccountBalance.new
  end

  # GET /vat_account_balances/1/edit
  def edit
  end

  # POST /vat_account_balances
  # POST /vat_account_balances.json
  def create
    @vat_account_balance = VatAccountBalance.new(vat_account_balance_params)

    respond_to do |format|
      if @vat_account_balance.save
        format.html { redirect_to @vat_account_balance, notice: 'Vat account balance was successfully created.' }
        format.json { render :show, status: :created, location: @vat_account_balance }
      else
        format.html { render :new }
        format.json { render json: @vat_account_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vat_account_balances/1
  # PATCH/PUT /vat_account_balances/1.json
  def update
    respond_to do |format|
      if @vat_account_balance.update(vat_account_balance_params)
        format.html { redirect_to @vat_account_balance, notice: 'Vat account balance was successfully updated.' }
        format.json { render :show, status: :ok, location: @vat_account_balance }
      else
        format.html { render :edit }
        format.json { render json: @vat_account_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vat_account_balances/1
  # DELETE /vat_account_balances/1.json
  def destroy
    @vat_account_balance.destroy
    respond_to do |format|
      format.html { redirect_to vat_account_balances_url, notice: 'Vat account balance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vat_account_balance
      @vat_account_balance = VatAccountBalance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vat_account_balance_params
      params.require(:vat_account_balance).permit(:date, :gl_account_id, :reference, :description, :vat_amount, :user_id, :sales_entry_id, :purchase_entry_id, :journal_entry_id, :sale_id, :purchase_id, :financial_transaction_id)
    end
end
