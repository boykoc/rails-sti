class DraftTimesheet < Timesheet
  belongs_to :accepted_timesheet

  # Create submitted timesheet from draft.  
  def submit
    # Handle exception if draft already submitted.
    begin
      submitted_timesheet = self.becomes!(SubmittedTimesheet)
    rescue ActiveRecord::RecordNotFound
      redirect_to timesheets_path, notice: 'This draft no longer exists or has already been submitted.'
      return
    end
    submitted_timesheet
  end
end
