json.extract! draft_timesheet, :id, :created_at, :updated_at
json.url draft_timesheet_url(draft_timesheet, format: :json)