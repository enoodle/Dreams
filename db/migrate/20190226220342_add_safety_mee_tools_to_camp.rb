class AddSafetyMeeToolsToCamp < ActiveRecord::Migration
  def change
    add_column :camps, :safety_uses_telescopic_loader, :boolean, null: false, default: false
    add_column :camps, :safety_uses_aerial_work_platform, :boolean, null: false, default: false
    add_column :camps, :safety_uses_backhoe_loader, :boolean, null: false, default: false
  end
end
