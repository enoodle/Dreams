# == Schema Information
#
# Table name: people
#
#  id                  :integer          not null, primary key
#  name                :string
#  email               :string
#  phone_number        :string
#  background          :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  camp_id             :integer          not null
#  has_ticket          :boolean
#  needs_early_arrival :boolean
#

class EmailInSpark < ActiveModel::Validator
  def validate(record)
    if !Person.email_registered?(record.email)
      record.errors[:email] << I18n.t("email_not_in_spark") + " #{record.email}"
    end
  end
end

class Person < ActiveRecord::Base
  CSV_ATTRIBUTES = %w{email name phone_number responsibilities
    dream_name dream_number}.freeze
  belongs_to :camp, validate: true
  has_and_belongs_to_many :roles

  validates :name, presence: true
  validates :email, presence: true
  validates_with EmailInSpark, :on => :create

  schema_validations whitelist: [:id, :created_at, :updated_at, :camp]

  scope :in_camp, -> { joins(:camp) }

  def self.to_csv
    humanize = lambda { |x| x ? "Yes" : "No" }
    CSV.generate(headers: true) do |csv|
      csv << CSV_ATTRIBUTES.map{ |attr| attr.titleize}
      Person.includes(:camp, :roles).where(:camps => {:event_id => Rails.application.config.default_event}).each do |p|
        csv << [
          p.email, p.name, p.phone_number, p.roles.pluck(:identifier).join("|"),
          p.camp.en_name, p.camp.id,
          humanize.call(p.needs_early_arrival), humanize.call(p.has_ticket)
        ]
      end
    end
  end

  def self.email_registered?(email)
    begin
      r = HTTParty.post(
        URI.join(ENV['SPARK_HOST'], 'volunteers/profiles').to_s,
        body: {emails: [email]}.to_json,
        headers: {
          token: ENV['SPARK_TOKEN'],
          'Content-Type': 'application/json'
        },
        timeout: 10
      )
      JSON.parse(r.body)[0].key? 'user_data'
    rescue
      false
    end
  end
end
