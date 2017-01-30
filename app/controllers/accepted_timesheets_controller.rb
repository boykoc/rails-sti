class AcceptedTimesheetsController < ApplicationController
  before_action :set_accepted_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /accepted_timesheets
  # GET /accepted_timesheets.json
  def index
    @timesheets = Timesheet.all
  end

  # GET /accepted_timesheets/1
  # GET /accepted_timesheets/1.json
  def show
  end

  # GET /accepted_timesheets/new
  def new
    @accepted_timesheet = AcceptedTimesheet.new
  end

  # GET /accepted_timesheets/1/edit
  def edit
  end

  # POST /accepted_timesheets
  # POST /accepted_timesheets.json
  def create
    @accepted_timesheet = AcceptedTimesheet.new(accepted_timesheet_params)

    respond_to do |format|
      if @accepted_timesheet.save
        format.html { redirect_to @accepted_timesheet, notice: 'Accepted timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @accepted_timesheet }
      else
        format.html { render :new }
        format.json { render json: @accepted_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accepted_timesheets/1
  # PATCH/PUT /accepted_timesheets/1.json
  def update
    # Set submitted_timesheet if submitted_timesheet_id exists in params.
    if (params.has_key?(:submitted_timesheet_id))
      submitted_timesheet = SubmittedTimesheet.find(params[:submitted_timesheet_id])
      # Replace params with submitted_timesheet attributes.
      params[:accepted_timesheet] = submitted_timesheet.accept
    end
    respond_to do |format|
      if @accepted_timesheet.update(accepted_timesheet_params)
        # Destroy the submitted_timesheet if it exists.
        submitted_timesheet.destroy if submitted_timesheet
        format.html { redirect_to accepted_timesheets_url, notice: 'Accepted timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @accepted_timesheet }
      else
        format.html { render :edit }
        format.json { render json: @accepted_timesheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accepted_timesheets/1
  # DELETE /accepted_timesheets/1.json
  def destroy
    @accepted_timesheet.destroy
    respond_to do |format|
      format.html { redirect_to accepted_timesheets_url, notice: 'Accepted timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accepted_timesheet
      @accepted_timesheet = AcceptedTimesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accepted_timesheet_params
      params.require(:accepted_timesheet).permit(:name)
    end
end
