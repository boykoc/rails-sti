class AcceptedTimesheetsController < ApplicationController
  before_action :set_accepted_timesheet, only: [:show, :edit, :update, :destroy]

  # GET /accepted_timesheets
  # GET /accepted_timesheets.json
  def index
    @accepted_timesheets = AcceptedTimesheet.all
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
    respond_to do |format|
      if @accepted_timesheet.update(accepted_timesheet_params)
        format.html { redirect_to @accepted_timesheet, notice: 'Accepted timesheet was successfully updated.' }
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
  
  # POST /accepted_timesheets/1/draft
  def draft
    begin
      set_accepted_timesheet
      draft_timesheet = @accepted_timesheet.dup
      draft_timesheet.becomes!(DraftTimesheet)
      draft_timesheet.accepted_timesheet_id = @accepted_timesheet.id
    rescue ActiveRecord::RecordNotFound
      redirect_to timesheets_path, notice: 'Can\'t make a draft of a draft.'
      return
    end
    respond_to do |format|
      if draft_timesheet.save
        format.html { redirect_to draft_timesheets_url, notice: 'Accepted timesheet was converted to DraftTimesheet.' }
      else
        format.html { render @draft_timesheet, notice: 'Accepted timesheet was NOT converted to DraftTimesheet.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accepted_timesheet
      @accepted_timesheet = AcceptedTimesheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accepted_timesheet_params
      params.fetch(:accepted_timesheet, {})
    end
end
