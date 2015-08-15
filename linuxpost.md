curl -v 10.21.176.88:3000/telemetries -X POST \
-H "Accept: application/json" \
-H "Content-Type: application/json" \
-d '{"telemetry"=>{"co_level"=>"1"}}'