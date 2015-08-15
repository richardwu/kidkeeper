class CreateTelemetries < ActiveRecord::Migration
  def change
    create_table :telemetries do |t|
      t.float :temp

      t.float :co_level

      t.float :meth_level

      t.float :longitude
      t.float :latitude
      t.timestamps null: false
    end
  end
end
