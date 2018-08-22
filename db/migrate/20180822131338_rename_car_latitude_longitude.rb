class RenameCarLatitudeLongitude < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :lat, :latitude
    rename_column :cars, :lng, :longitude
  end
end
