class AddRememberableTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string, limit: 80
    User.find_each do |u|
      u.generate_remember_token
      u.save
    end
  end
end
