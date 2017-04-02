require 'concerns/RegistrationValidation'

class User < ActiveRecord::Base
  include RegistrationValidation
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise_options = [:database_authenticatable, :rememberable, :trackable, :validatable]
  if Rails.configuration.x.firestarter_settings['spark']
    devise_options << :spark_authenticatable
  else
    devise_options << :recoverable
    devise_options << :registerable
  end
  devise *devise_options


  has_many :tickets
  has_many :memberships
  has_many :camps, through: :memberships
  has_many :created_camps, class_name: :Camp

  schema_validations whitelist: [:id, :created_at, :updated_at, :encrypted_password, :password, :remember_token]

  before_validation :generate_remember_token

  # Again, from Rails Girls tutorial on Facebook auth.
  # Used for handling the facebook auth callback.

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      #user.name = auth.info.name # We don't persist usernames to the DB.
    end
  end

  def generate_remember_token
    self.remember_token = Devise.friendly_token(80) if remember_token.blank?
  end

  protected

  def password_required?
    return false if Rails.configuration.x.firestarter_settings['spark']
    super
  end
end
