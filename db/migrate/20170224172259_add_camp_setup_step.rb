class AddCampSetupStep < ActiveRecord::Migration
  def change
    create_table :camp_setup_steps do |t|
      t.integer :camp_id, null: false
      t.index :camp_id
      t.integer :day_number
      t.string :main_tasks
      t.string :additional_tasks
    end
  end
end
