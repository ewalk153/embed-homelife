json.extract! observation, :id, :client_id, :data, :created_at, :updated_at, :local_time, :temperature
json.url observation_url(observation, format: :json)
