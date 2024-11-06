json.extract! event, :id, :name, :description, :starting_date, :ending_date, :created_at, :updated_at
json.url event_url(event, format: :json)
