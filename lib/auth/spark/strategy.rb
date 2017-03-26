require 'devise/strategies/authenticatable'
require_relative 'model'

module Devise
  module Strategies
    class SparkAuthenticatable < Authenticatable
      def valid?
        Rails.configuration.x.firestarter_settings['spark'] and params_auth_hash.present? and
            params_auth_hash['email'].present? and params_auth_hash['password'].present?
      end

      def authenticate!
        email = params_auth_hash['email'].downcase
        Rails.logger.debug("Attempting Spark login for #{email}")
        r = HTTParty.post(ENV['SPARK_URL'].to_s, body: { email: email, password: params_auth_hash['password'] })
        if r.json['status'] == "true"
          user = User.where(email: email).first_or_create! do |u|
            u.password = nil
            u.spark_user = true
            # TODO: Fill in more details from Spark here
          end
          success!(user)
        else
          fail(:not_found_in_database)
        end
      end
    end
  end
end
