class AddDefaultImageIdToCamp < ActiveRecord::Migration
  def up
    add_column :camps, :default_image_id, :integer

    Camp.all.each do |cmp|
      say_with_time("Setting default image for camp #{cmp.id}") do
        cmp.update(:default_image_id => cmp.images.first.id) unless cmp.images.empty?
      end
    end
  end

  def down
    remove_column :camps, :default_image_id
  end
end
