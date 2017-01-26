json.extract! submitted_timesheet, :id, :created_at, :updated_at
json.url submitted_timesheet_url(submitted_timesheet, format: :json)