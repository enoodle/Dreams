class AddApprovalStatusToCamp < ActiveRecord::Migration
  def change
    add_column :camps, :approved_status, :boolean, :default => false
  end
end
