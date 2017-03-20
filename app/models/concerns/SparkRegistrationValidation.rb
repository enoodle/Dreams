require 'net/http'
require 'json'

module SparkRegistrationValidation
 extend ActiveSupport::Concern

  included do
    if Rails.configuration.x.firestarter_settings["spark"] and ENV['SPARK_URL'].present?
      validate :validate_using_spark, :on => :create
    end
  end

  def validate_using_spark
    self.email = self.email.downcase
    url = ENV['SPARK_URL'].to_s + "?username=" + self.email + "&password=" + self.password
    uri = URI(url)
    response = Net::HTTP.get(uri)
    spark_response = JSON.parse(response)

    if spark_response["status"] == "true"
      return
    else
      self.errors.add(:password, I18n.t(:invalid_spark_details))
    end

  end
end