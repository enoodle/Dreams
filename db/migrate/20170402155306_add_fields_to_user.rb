class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string, :limit => 128
    add_column :users, :lastname, :string, :limit => 128
    add_column :users, :phone, :string, :limit => 32
  end
end
