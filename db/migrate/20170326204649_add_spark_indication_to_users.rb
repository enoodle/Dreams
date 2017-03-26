class AddSparkIndicationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :spark_user, :boolean, default: false, null: false
  end
end
