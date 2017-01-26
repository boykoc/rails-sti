class AcceptedTimesheet < Timesheet
  has_many :submitted_timesheets
  has_one :draft_timesheet
end
