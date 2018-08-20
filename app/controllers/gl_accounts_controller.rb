class GlAccountsController < ApplicationController
  before_action :set_gl_account, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  # GET /gl_accounts
  # GET /gl_accounts.json
  def index
    @gl_accounts = GlAccount.all.where("user_id =?", current_user.id)
        @gl_account = GlAccount.new
    @gl_account.user_id = current_user.id
  end

  # GET /gl_accounts/1
  # GET /gl_accounts/1.json
  def show
  end

  # GET /gl_accounts/new
  def new
    @gl_account = GlAccount.new
    @gl_account.user_id = current_user.id
  end

  # GET /gl_accounts/1/edit
  def edit
  end

  # POST /gl_accounts
  # POST /gl_accounts.json
  def create
    @gl_account = GlAccount.new(gl_account_params)
    @gl_account.user_id = current_user.id

    respond_to do |format|
      if @gl_account.save
        format.html { redirect_to @gl_account, notice: 'Gl account was successfully created.' }
        format.json { render :show, status: :created, location: @gl_account }
      else
        format.html { render :new }
        format.json { render json: @gl_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gl_accounts/1
  # PATCH/PUT /gl_accounts/1.json
  def update
    respond_to do |format|
      if @gl_account.update(gl_account_params)
        format.html { redirect_to @gl_account, notice: 'Gl account was successfully updated.' }
        format.json { render :show, status: :ok, location: @gl_account }
      else
        format.html { render :edit }
        format.json { render json: @gl_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gl_accounts/1
  # DELETE /gl_accounts/1.json
  def destroy
    @gl_account.destroy
    respond_to do |format|
      format.html { redirect_to gl_accounts_url, notice: 'Gl account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gl_account
      @gl_account = GlAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gl_account_params
      params.require(:gl_account).permit(:code, :name, :account_type, :user_id, :account_balance)
    end
end
