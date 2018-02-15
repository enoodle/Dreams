class AddMooperToRoles < ActiveRecord::Migration
  def change
    Rails.application.config_for(:roles)['new_roles'].each do |r|
      Role.create!(identifier: r)
    end
  end
end
