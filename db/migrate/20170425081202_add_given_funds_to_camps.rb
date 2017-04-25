class AddGivenFundsToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :given_funds, :integer
  end
end
