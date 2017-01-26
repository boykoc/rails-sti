json.extract! timesheet, :id, :type, :name, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)