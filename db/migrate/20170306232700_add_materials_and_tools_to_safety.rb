class AddMaterialsAndToolsToSafety < ActiveRecord::Migration
  def change
    add_column :camps, :safety_materials, :string, :limit => 4096
    add_column :camps, :safety_tools, :string, :limit => 4096
  end
end
