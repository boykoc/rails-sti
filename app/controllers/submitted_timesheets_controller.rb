class SubmittedTimesheetsController < ApplicationController
  before_action :set_submitted_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /submitted_timesheets
  # GET /submitted_timesheets.json
  def index
    @submitted_timesheets = SubmittedTimesheet.all
  end

  # GET /submitted_timesheets/1
  # GET /submitted_timesheets/1.json
  def show
  end

  # GET /submitted_timesheets/new
  def new
    @submitted_timesheet = SubmittedTimesheet.new
  end

  # GET /submitted_timesheets/1/edit
  def edit
  end

  # POST /submitted_timesheets
  # POST /submitted_timesheets.json
  def create
    # Get the draft_timesheet.
    draft_timesheet = DraftTimesheet.find(params[:draft_timesheet_id])
    # Build a submitted_timesheet.
    @submitted_timesheet = draft_timesheet.submit
    # Try to save the submitted_timesheet.
    respond_to do |format|
      if @submitted_timesheet.save
        format.html { redirect_to accepted_timesheets_url, notice: 'Submitted timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @submitted_timesheet }
      else
        format.html { render :new }
        format.json { render json: @submitted_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submitted_timesheets/1
  # PATCH/PUT /submitted_timesheets/1.json
  def update
    respond_to do |format|
      if @submitted_timesheet.update(submitted_timesheet_params)
        format.html { redirect_to accepted_timesheets_url, notice: 'Submitted timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @submitted_timesheet }
      else
        format.html { render :edit }
        format.json { render json: @submitted_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submitted_timesheets/1
  # DELETE /submitted_timesheets/1.json
  def destroy
    @submitted_timesheet.destroy
    respond_to do |format|
      format.html { redirect_to submitted_timesheets_url, notice: 'Submitted timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submitted_timesheet
      @submitted_timesheet = SubmittedTimesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submitted_timesheet_params
      params.require(:submitted_timesheet).permit(:name)
    end
end
