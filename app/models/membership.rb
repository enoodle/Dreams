# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  camp_id    :integer
#

class Membership < ActiveRecord::Base
  belongs_to :camp
  belongs_to :user
end
