class Grant < ActiveRecord::Base
  belongs_to :user
  belongs_to :camp

  def self.granting_enabled?
    Rails.configuration.x.firestarter_settings['granting_active']
  end

  def self.granting_allowed?
    granting_enabled? and Lockdown.instance.allowed?('vote_hearts')
  end

  def self.estimated_value
    grant_sum = Grant.sum(:amount)
    return 0 if grant_sum == 0
    Rails.application.config.budget_value.to_f / grant_sum
  end
end
