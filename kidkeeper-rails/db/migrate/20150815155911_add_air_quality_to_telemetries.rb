class AddAirQualityToTelemetries < ActiveRecord::Migration
  def change
  	add_column :telemetries, :air_quality, :integer
  	add_column :telemetries, :light, :integer
  	add_column :telemetries, :sound, :integer
  	remove_column :telemetries, :co_level, :float
  	remove_column :telemetries, :meth_level, :float
  end
end
