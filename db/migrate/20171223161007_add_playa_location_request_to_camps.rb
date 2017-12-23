class AddPlayaLocationRequestToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :location_request_desc, :text, :limit => 1042
  end
end
