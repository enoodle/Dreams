class CampSetupStep < ActiveRecord::Base
  belongs_to :camp
  default_scope { order(:day_number) }
end
