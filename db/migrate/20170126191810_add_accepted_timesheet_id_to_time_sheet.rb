class AddAcceptedTimesheetIdToTimeSheet < ActiveRecord::Migration
  def change
    add_column :timesheets, :accepted_timesheet_id, :interger 
  end
end
