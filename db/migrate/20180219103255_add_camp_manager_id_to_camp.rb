class AddCampManagerIdToCamp < ActiveRecord::Migration
  def up
    add_column :camps, :camp_manager_id, :integer

    Camp.all.each do |cmp|
      say_with_time("Setting camp_manager_id for camp #{cmp.id}") do
        cmp.update(:camp_manager_id => cmp.people.first.id) unless cmp.people.empty?
      end
    end
  end

  def down
    remove_column :camps, :camp_manager_id
  end
end
