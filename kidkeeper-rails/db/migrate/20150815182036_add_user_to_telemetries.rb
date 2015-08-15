class AddUserToTelemetries < ActiveRecord::Migration
  def change
  	add_reference :telemetries, :user, index: true
  end
end
