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
        r = HTTParty.post(ENV['SPARK_URL'].to_s, body: { username: email, password: params_auth_hash['password'], token: ENV['SPARK_TOKEN'] })
        if r['status'] == "true"
          unless user = User.where(email: email).first
            user = User.create!(email: email, encrypted_password: nil) do |u|
              Rails.logger.debug(r)
              u.spark_user = true
              u.firstname = r['firstname']
              u.lastname = r['lastname']
              u.phone = r['phone']
              # TODO: Fill in more details from Spark here
            end
          end
          user.update!(spark_user: true, encrypted_password: nil)
          success!(user)
        else
          fail(:invalid_spark_details) #TODO - We want to display this message to help user understand better what is wrong
        end
      end
    end
  end
end
