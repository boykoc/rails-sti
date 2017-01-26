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
    @draft_timesheet = DraftTimesheet.new(draft_timesheet_params)

    respond_to do |format|
      if @draft_timesheet.save
        format.html { redirect_to @draft_timesheet, notice: 'Draft timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @draft_timesheet }
      else
        format.html { render :new }
        format.json { render json: @draft_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /draft_timesheets/1
  # PATCH/PUT /draft_timesheets/1.json
  def update
    respond_to do |format|
      if @draft_timesheet.update(draft_timesheet_params)
        format.html { redirect_to @draft_timesheet, notice: 'Draft timesheet was successfully updated.' }
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
  
  # POST /draft_timesheets/1/submit
  def submit
    # Handle exception if drafts already been submitted.
    begin
      set_draft_timesheet
      submitted_timesheet = @draft_timesheet.becomes!(SubmittedTimesheet)
    rescue ActiveRecord::RecordNotFound
      redirect_to timesheets_path, notice: 'This draft no longer exists or has already been submitted.'
      return
    end
    respond_to do |format|
      if submitted_timesheet.save
        format.html { redirect_to draft_timesheets_url, notice: 'Draft timesheet was converted to SubmittedTimesheet.' }
      else
        format.html { render @draft_timesheet, notice: 'Draft timesheet was NOT converted to SubmittedTimesheet.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_draft_timesheet
      @draft_timesheet = DraftTimesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def draft_timesheet_params
      params.fetch(:draft_timesheet, {})
    end
end
