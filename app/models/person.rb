class Person < ActiveRecord::Base
  CSV_ATTRIBUTES = %w{email name phone_number responsibilities
    dream_name dream_number}.freeze
  belongs_to :camp, validate: true
  has_and_belongs_to_many :roles

  validates :name, presence: true

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
end
