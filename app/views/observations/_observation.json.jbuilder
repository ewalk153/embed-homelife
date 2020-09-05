json.extract! observation, :id, :client_id, :data, :created_at, :updated_at
json.url observation_url(observation, format: :json)
