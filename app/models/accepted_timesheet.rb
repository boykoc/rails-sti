class AcceptedTimesheet < Timesheet
  has_many :submitted_timesheets
  has_one :draft_timesheet
  
  # Build draft timesheet from accepted_timesheet.
  def draft
    begin
      draft_timesheet = self.dup
      draft_timesheet.becomes!(DraftTimesheet)
      draft_timesheet.accepted_timesheet_id = self.id
    rescue ActiveRecord::RecordNotFound
      redirect_to timesheets_path, notice: 'Can\'t make a draft of a draft.'
      return
    end
    draft_timesheet
  end
end
