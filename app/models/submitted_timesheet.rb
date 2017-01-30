class SubmittedTimesheet < Timesheet
  belongs_to :accepted_timesheet
  
  # Update accetped timesheet with draft.
  def accept
    begin
      accepted_timesheet_params = self.attributes.except('id', 'type', 'created_at', 'updated_at', 'accepted_timesheet_id')
    rescue ActiveRecord::RecordNotFound
      redirect_to timesheets_path, notice: 'This original timesheet or submitted timesheet no longer exists.'
      return
    end
    accepted_timesheet_params
  end
end
