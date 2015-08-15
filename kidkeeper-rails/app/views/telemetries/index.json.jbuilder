json.array!(@telemetries) do |telemetry|
  json.extract! telemetry, :id
  json.url telemetry_url(telemetry, format: :json)
end
