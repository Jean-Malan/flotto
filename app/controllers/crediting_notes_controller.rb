class CreditingNotesController < ApplicationController
  before_action :set_crediting_note, only: [:show, :edit, :update, :destroy]

  # GET /crediting_notes
  # GET /crediting_notes.json
  def index
    @crediting_notes = CreditingNote.all
  end

  # GET /crediting_notes/1
  # GET /crediting_notes/1.json
  def show
  end

  # GET /crediting_notes/new
  def new
    @crediting_note = CreditingNote.new
  end

  # GET /crediting_notes/1/edit
  def edit
  end

  # POST /crediting_notes
  # POST /crediting_notes.json
  def create
    @crediting_note = CreditingNote.new(crediting_note_params)

    respond_to do |format|
      if @crediting_note.save
        format.html { redirect_to @crediting_note, notice: 'Crediting note was successfully created.' }
        format.json { render :show, status: :created, location: @crediting_note }
      else
        format.html { render :new }
        format.json { render json: @crediting_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crediting_notes/1
  # PATCH/PUT /crediting_notes/1.json
  def update
    respond_to do |format|
      if @crediting_note.update(crediting_note_params)
        format.html { redirect_to @crediting_note, notice: 'Crediting note was successfully updated.' }
        format.json { render :show, status: :ok, location: @crediting_note }
      else
        format.html { render :edit }
        format.json { render json: @crediting_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crediting_notes/1
  # DELETE /crediting_notes/1.json
  def destroy
    @crediting_note.destroy
    respond_to do |format|
      format.html { redirect_to crediting_notes_url, notice: 'Crediting note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crediting_note
      @crediting_note = CreditingNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crediting_note_params
      params.require(:crediting_note).permit(:credit_amount, :contact_id, :date, :user_id, :sale_id, :purchase_id, :balance)
    end
end
