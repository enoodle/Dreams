# == Schema Information
#
# Table name: camp_setup_steps
#
#  id               :integer          not null, primary key
#  camp_id          :integer          not null
#  day_number       :integer
#  main_tasks       :string
#  additional_tasks :string
#

class CampSetupStep < ActiveRecord::Base
  belongs_to :camp
  default_scope { order(:day_number) }
end
