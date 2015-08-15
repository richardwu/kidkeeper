

json.extract! @telemetry, :id, :longitude, :latitude, :created_at, :updated_at

if @telemetry.temp.nil?
	json.temp 'NoData'
else
	json.temp @telemetry.temp.to_s + '°C' 
end

if @telemetry.temp.nil?
	json.temp_str 'NoData'
elsif @telemetry.temp >= 40
	json.temp_str 'Very high'
elsif @telemetry.temp >= 30
	json.temp_str 'High'
elsif @telemetry.temp >= 20
	json.temp_str 'Normal'
elsif @telemetry.temp >= 10
	json.temp_str 'Low'
elsif @telemetry.temp >= 0 
	json.temp_str 'Very low'
else
	json.temp_str 'Freezing'
end

case @telemetry.air_quality
when 0
	json.air_quality 'Clean'
when 1
	json.air_quality 'Low pollution'
when 2
	json.air_quality 'High pollution'
when 3
	json.air_quality 'Alert pollution'
else
	json.air_quality 'NoData'
end

case @telemetry.light
when 0
	json.light 'Dark'
when 1
	json.light 'Light'
when 2
	json.light 'Bright'
else
	json.light 'NoData'
end

case @telemetry.sound
when 0
	json.sound 'Quiet'
when 1
	json.sound 'Little sound'
when 2
	json.sound 'High sound'
when 3
	json.sound 'Noisy'
else 
	json.sound 'NoData'
end


case @telemetry.humidity
when 0
	json.humidity 'High'
when 1
	json.humidity 'Normal'
when 2
	json.humidity 'Low'
else 
	json.humidity 'NoData'
end


