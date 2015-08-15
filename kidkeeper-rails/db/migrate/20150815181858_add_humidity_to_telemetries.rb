class AddHumidityToTelemetries < ActiveRecord::Migration
  def change
  	add_column :telemetries, :humidity, :integer
  end
end
