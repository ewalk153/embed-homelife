class Observation < ApplicationRecord
  def temperature
    return nil if data.empty?
    return data.to_f if data == data.to_f.to_s
    json = JSON.parse(data)
    if json.dig("temperature").present?
      return json['temperature']
    end

    data
  end

  def local_time
    created_at.in_time_zone("America/New_York").to_formatted_s(:short)
  end
end
