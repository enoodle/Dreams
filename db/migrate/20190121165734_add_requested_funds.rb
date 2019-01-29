class AddRequestedFunds < ActiveRecord::Migration
  def up
    add_column :camps, :requested_funds, :integer
    add_column :camps, :requested_funds_fallback, :integer
  end

  def down
    remove_column :camps, :requested_funds_fallback
    remove_column :camps, :requested_funds
  end
end
