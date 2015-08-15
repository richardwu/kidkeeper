class AddLastNotifsToTelemetries < ActiveRecord::Migration
  def change
  	add_column :telemetries, :notif_temp, :datetime 
  	add_column :telemetries, :notif_air, :datetime 
  	add_column :telemetries, :notif_sound, :datetime 
  	add_column :telemetries, :notif_humidity, :datetime 

  end
end
