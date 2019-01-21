# == Schema Information
#
# Table name: grants
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  camp_id    :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Grant < ActiveRecord::Base
  belongs_to :user
  belongs_to :camp

  def self.granting_enabled?
    Rails.configuration.x.firestarter_settings['granting_active']
  end

  def self.granting_allowed?
    granting_enabled? and Lockdown.instance.allowed?('vote_hearts')
  end

  def self.estimated_value(default_value=0)
    grant_sum = Grant.sum(:amount)
    # prevent ZeroDivision
    return default_value if grant_sum == 0
    Rails.application.config.budget_value.to_f / grant_sum
  end
end
