class DraftTimesheetsController < ApplicationController
  before_action :set_draft_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /draft_timesheets
  # GET /draft_timesheets.json
  def index
    @draft_timesheets = DraftTimesheet.all
  end

  # GET /draft_timesheets/1
  # GET /draft_timesheets/1.json
  def show
  end

  # GET /draft_timesheets/new
  def new
    @draft_timesheet = DraftTimesheet.new
  end

  # GET /draft_timesheets/1/edit
  def edit
  end

  # POST /draft_timesheets
  # POST /draft_timesheets.json
  def create
    # Get the accepted_timesheet.
    accepted_timesheet = AcceptedTimesheet.find(params[:accepted_timesheet_id])
    # Build a draft_timesheet.
    @draft_timesheet = accepted_timesheet.draft
    # Try to save the draft_timesheet.
    respond_to do |format|
      if @draft_timesheet.save
        format.html { redirect_to accepted_timesheets_url, notice: 'Accepted timesheet was converted to DraftTimesheet.' }
      else
        format.html { render @draft_timesheet, notice: 'Accepted timesheet was NOT converted to DraftTimesheet.' }
      end
    end
  end

  # PATCH/PUT /draft_timesheets/1
  # PATCH/PUT /draft_timesheets/1.json
  def update
    respond_to do |format|
      if @draft_timesheet.update(draft_timesheet_params)
        format.html { redirect_to accepted_timesheets_url, notice: 'Draft timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @draft_timesheet }
      else
        format.html { render :edit }
        format.json { render json: @draft_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /draft_timesheets/1
  # DELETE /draft_timesheets/1.json
  def destroy
    @draft_timesheet.destroy
    respond_to do |format|
      format.html { redirect_to draft_timesheets_url, notice: 'Draft timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft_timesheet
      @draft_timesheet = DraftTimesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def draft_timesheet_params
      params.require(:draft_timesheet).permit(:name)
    end
end
