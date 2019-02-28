# == Schema Information
#
# Table name: camps
#
#  id                                                       :integer          not null, primary key
#  name                                                     :string(64)       not null
#  subtitle                                                 :text(255)        not null
#  contact_email                                            :string(64)
#  contact_name                                             :string(64)       not null
#  contact_phone                                            :string(64)
#  description                                              :text(4096)
#  electricity                                              :text(255)
#  light                                                    :text(512)
#  fire                                                     :text(512)
#  noise                                                    :text(255)
#  nature                                                   :text(255)
#  moop                                                     :text(512)
#  plan                                                     :text(1024)
#  cocreation                                               :text(1024)
#  neighbors                                                :text(512)
#  budgetplan                                               :text(1024)
#  minbudget                                                :integer
#  maxbudget                                                :integer
#  seeking_members                                          :boolean
#  user_id                                                  :integer
#  grantingtoggle                                           :boolean          default(FALSE), not null
#  created_at                                               :datetime
#  updated_at                                               :datetime
#  minfunded                                                :boolean          default(FALSE)
#  fullyfunded                                              :boolean          default(FALSE)
#  recycling                                                :text(512)
#  minbudget_realcurrency                                   :integer
#  maxbudget_realcurrency                                   :integer
#  safetybag_crewsize                                       :integer
#  safetybag_plan                                           :string(4096)
#  safetybag_builder                                        :string(64)
#  safetybag_safetyer                                       :string(64)
#  safetybag_mooper                                         :string(64)
#  safetybag_materials                                      :string(4096)
#  safetybag_work_in_height                                 :string(4096)
#  safetybag_tools                                          :string(4096)
#  safetybag_grounding                                      :string(4096)
#  safetybag_safety                                         :string(4096)
#  safetybag_electricity                                    :string(4096)
#  safetybag_daily_routine                                  :string(4096)
#  safetybag_other_comments                                 :string(4096)
#  safetybag_firstMemberName                                :string(64)
#  safetybag_firstMemberEmail                               :string(64)
#  safetybag_secondMemberName                               :string(64)
#  safetybag_secondMemberEmail                              :string(64)
#  dreamprop_philosophy                                     :string(4096)
#  dreamprop_inspiration                                    :string(4096)
#  dreamprop_interactivity_audience_participation           :string(4096)
#  dreamprop_interactivity_is_fire_present                  :boolean          default(FALSE), not null
#  dreamprop_interactivity_fire_present_desc                :string(4096)
#  dreamprop_interactivity_is_sound                         :boolean          default(FALSE), not null
#  dreamprop_interactivity_sound_desc                       :string(4096)
#  dreamprop_interactivity_is_fire_event                    :boolean          default(FALSE), not null
#  dreamprop_interactivity_fire_event_desc                  :string(4096)
#  dreamprop_community_is_installation_present_for_event    :boolean          default(FALSE), not null
#  dreamprop_community_is_installation_present_for_public   :boolean          default(FALSE), not null
#  dreamprop_community_is_context                           :boolean          default(FALSE), not null
#  dreamprop_community_context_desc                         :string(4096)
#  dreamprop_community_is_interested_in_publicity           :boolean          default(FALSE), not null
#  dreamprop_theme_is_annual                                :boolean          default(FALSE), not null
#  dreamprop_theme_annual_desc                              :string(4096)
#  active                                                   :boolean          default(TRUE)
#  about_the_artist                                         :string(1024)
#  website                                                  :string(512)
#  is_public                                                :boolean          default(TRUE), not null
#  spec_physical_description                                :string(4096)
#  spec_length                                              :string(128)
#  spec_width                                               :string(128)
#  spec_height                                              :string(128)
#  spec_visual_night_day                                    :string(4096)
#  spec_is_electricity                                      :boolean          default(FALSE), not null
#  spec_electricity_details                                 :string(4096)
#  spec_electricity_how                                     :string(4096)
#  spec_electricity_is_daytime                              :boolean          default(FALSE), not null
#  spec_electricity_watt                                    :string(512)
#  safety_is_heavy_equipment                                :boolean          default(FALSE), not null
#  safety_equipment                                         :string(4096)
#  safety_how_to_build_safety                               :string(4096)
#  safety_how                                               :string(4096)
#  safety_grounding                                         :string(4096)
#  safety_securing                                          :string(4096)
#  safety_securing_parts                                    :string(4096)
#  safety_signs                                             :string(4096)
#  location_info                                            :string(1024)
#  program_dream_name_he                                    :string(256)
#  program_dream_name_en                                    :string(256)
#  program_dreamer_name_he                                  :string(256)
#  program_dreamer_name_en                                  :string(256)
#  program_dream_about_he                                   :string(4096)
#  program_dream_about_en                                   :string(4096)
#  program_special_activity                                 :string(4096)
#  google_drive_folder_path                                 :string(512)
#  google_drive_budget_file_path                            :string(512)
#  dreamscholarship_fund_is_from_art_fund                   :boolean          default(FALSE), not null
#  dreamscholarship_fund_is_open_for_public                 :boolean          default(FALSE), not null
#  dreamscholarship_budget_min_original                     :integer          default(0)
#  dreamscholarship_budget_max_original                     :integer          default(0)
#  dreamscholarship_budget_max_original_desc                :string(4096)
#  dreamscholarship_bank_account_info                       :string(128)
#  dreamscholarship_financial_conduct_is_intial_budget      :boolean          default(FALSE), not null
#  dreamscholarship_financial_conduct_intial_budget_desc    :string(4096)
#  dreamscholarship_financial_conduct_money_raise_desc      :string(4096)
#  dreamscholarship_execution_potential_previous_experience :string(4096)
#  dreamscholarship_execution_potential_work_plan           :string(4096)
#  projectmgmt_is_theme_camp_dream                          :boolean          default(FALSE), not null
#  projectmgmt_is_dream_near_theme_camp                     :boolean          default(FALSE), not null
#  projectmgmt_dream_pre_construction_site                  :string(4096)
#  en_name                                                  :string(64)
#  en_subtitle                                              :string(255)
#  dream_point_of_contact_email                             :string(64)
#  safety_file_comments                                     :string(4096)
#  safety_materials                                         :string(4096)
#  safety_tools                                             :string(4096)
#  given_funds                                              :integer
#  event_id                                                 :string(128)      default("midburn2018")
#  location_request_desc                                    :text(1042)
#  scholarship_receiver_name                                :string
#  scholarship_receiver_id                                  :string
#  scholarship_receiver_living_address                      :string
#  scholarship_receiver_mailing_address                     :string
#  scholarship_receiver_bank_account_name                   :string
#  scholarship_receiver_bank_account_branch_name            :string
#  scholarship_receiver_bank_account_branch_number          :string
#  scholarship_receiver_bank_account_number                 :string
#  scholarship_receiver_contact_email                       :string
#  scholarship_receiver_contact_phone                       :string
#  default_image_id                                         :integer
#  camp_manager_id                                          :integer
#  requested_funds                                          :integer
#  requested_funds_fallback                                 :integer
#

class CanCreateNewDreamValidator < ActiveModel::Validator
  def validate(record)
    if Rails.application.config.x.firestarter_settings['disable_open_new_dream']
      record.errors[:base] << I18n.t("new_dream_is_disabled")
    end
  end
end

class Camp < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :images #, :dependent => :destroy
  belongs_to :default_image, class_name: 'Image', foreign_key: :default_image_id
  has_many :grants
  has_many :people, class_name: 'Person'
  belongs_to :camp_manager, class_name: 'Person', foreign_key: :camp_manager_id
  has_many :roles, through: :people
  has_many :setup_steps, class_name: :CampSetupStep

  PUBLIC_ATTRIBUTES = ['name','en_name','en_subtitle','subtitle','contact_email','contact_phone','contact_name','description','cocreation','about_the_artist','website']

  FUNDS_REQUEST_OPTIONS_NIS = [1_000, 2_500, 5_000, 7_000, 10_000, 20_000, 30_000]

  has_paper_trail  
  accepts_nested_attributes_for :people, :roles, :setup_steps, allow_destroy: true
  acts_as_taggable

  validates :creator, presence: true
  validates :name, presence: true
  validates :subtitle, presence: true
  validates :contact_name, presence: true
  validates :minbudget, :numericality => { :greater_than_or_equal_to => 0 }, allow_blank: true
  validates :minbudget_realcurrency, :numericality => { :greater_than_or_equal_to => 0 }, allow_blank: true
  validates :maxbudget, :numericality => { :greater_than_or_equal_to => 0 }, allow_blank: true
  validates :maxbudget_realcurrency, :numericality => { :greater_than_or_equal_to => 0 }, allow_blank: true
  validates_with CanCreateNewDreamValidator, :on => :create

  filterrific(
    default_filter_params: {
        sorted_by: 'updated_at_desc',
        not_seeking_funding: 1,
        not_fully_funded: 1
    },
    available_filters: [
      :sorted_by,
      :search_query,
      :not_fully_funded,
      :not_min_funded,
      :not_seeking_funding,
      :active,
      :not_hidden,
      :is_cocreation,
      :current_event
    ]
  )
  # Scope definitions. We implement all Filterrific filters through ActiveRecord
  # scopes. In this example we omit the implementation of the scopes for brevity.
  # Please see 'Scope patterns' for scope implementation details.
    scope :search_query, lambda { |query|
      return nil  if query.blank?
      # condition query, parse into individual keywords
      terms = query.downcase.split(/\s+/)
      # replace "*" with "%" for wildcard searches,
      # append '%', remove duplicate '%'s
      terms = terms.map { |e|
        ('%' + e.gsub('*', '%') + '%').gsub(/%+/, '%')
      }

      or_array = [
        "LOWER(camps.name) LIKE ?",
        "LOWER(camps.subtitle) LIKE ?",
        "LOWER(camps.cocreation) LIKE ?",
      ]

      if Rails.configuration.x.firestarter_settings["multi_lang_support"]
        or_array.push("LOWER(camps.en_name) LIKE ?",
          "LOWER(camps.en_subtitle) LIKE ?")
      end

      num_or_conditions = or_array.length

      where(
        terms.map {
          or_clauses = or_array.join(' OR ')
          "(#{ or_clauses })"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conditions }.flatten
      )
    }

  scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'

      case sort_option.to_s
      when /^name/
         # Simple sort on the created_at column.
         # Make sure to include the table name to avoid ambiguous column names.
         # Joining on other tables is quite common in Filterrific, and almost
         # every ActiveRecord table has a 'created_at' column.
         order("camps.name #{ direction }")
      when /^updated_at_/
         order("camps.updated_at #{ direction }")
      when /^created_at_/
         order("camps.created_at #{ direction }")
         raise(ArgumentError, "Sort option: #{ sort_option.inspect }")
        when /^random$/i
          order("RANDOM()")
      else
         raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
  }

  scope :not_fully_funded, lambda { |flag|
    return nil  if '0' == flag # checkbox unchecked
    where(fullyfunded: false)
  }

  scope :not_min_funded, lambda { |flag|
    return nil  if '0' == flag # checkbox unchecked
    where(minfunded: false)
  }

  scope :not_seeking_funding, lambda { |flag|
    return nil  if '0' == flag # checkbox unchecked
    where(grantingtoggle: true)
  }

  scope :active, lambda { |flag|
    where(active: true)
  }

  scope :not_hidden, lambda { |flag|
    where(is_public: flag)
  }

  scope :current_event, lambda { |flag|
    where(event_id: Rails.application.config.default_event)
  }

  scope :is_cocreation, lambda { |flag|
    where.not(camps: { cocreation: nil }).where.not(camps: { cocreation: '' })
  }

  # Used by ActiveAdmin
  scope :default_select, lambda { |except=%w(safetybag_firstMemberName safetybag_firstMemberEmail safetybag_secondMemberName safetybag_secondMemberEmail)|
    tn = table_name
    names = (column_names-except).map { |c| "#{tn}.#{c}" }.join(', ')
    select(names).group(names)
  }

  scope :displayed, -> {
    q = default_select.joins(:people)
      .where('people.id = camps.camp_manager_id')
    
    if connection.adapter_name == 'SQLite'
      q.select('people.name manager_name, people.email manager_email, people.phone_number manager_phone')
    else
      q.select('ARRAY_AGG(people.name) manager_name,
                ARRAY_AGG(people.email) manager_email,
                ARRAY_AGG(people.phone_number) manager_phone')
    end
  }

  scope :displayed_with_tags, -> {
    displayed.includes(:tags)
  }

  before_save do
    # This will be closed when we close the system in the future
    # (This comment is not relevant because it is more) No more - at this stage we're no longer aligning the budget
    # keep it here so we know that when we begin a new system we want this to happen
    align_budget
  end

  def hearts_received
    grants.sum(:amount)
  end

  def grants_received
    grants.sum(:amount) + (given_funds.to_f / Grant.estimated_value.to_f).to_i
  end

  def estimated_grants_worth
    grants_received * (Grant.granting_allowed? ? 1 : Grant.estimated_value.to_i)
  end

  # Translating the real currency to budget
  # This called on create and on update
  # Rounding up 0.1 = 1, 1.2 = 2
  def align_budget
    if self.minbudget_realcurrency.nil?
      self.minbudget = nil
    elsif self.minbudget_realcurrency > 0
      self.minbudget = (self.minbudget_realcurrency / Rails.application.config.coin_rate).ceil
    else
      self.minbudget = 0
    end

    if self.maxbudget_realcurrency.nil?
      self.maxbudget = nil
    elsif self.maxbudget_realcurrency > 0
      self.maxbudget = (self.maxbudget_realcurrency / Rails.application.config.coin_rate).ceil
    else
      self.maxbudget = 0
    end
  end

  def link
    "#{ENV['APP_URL']}/dreams/#{self.id}"
  end

  CSV_ATTRIBUTES = %w{dream_name dream_id approval_status manager_name manager_email manager_phone angel_name angle_email dream_link}.freeze

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << CSV_ATTRIBUTES.map{ |col_name| I18n.t(col_name)}
      Camp.where(:event_id => Rails.application.config.default_event).each do |c|
        csv << [c.en_name, c.id, (c.approved_status ? I18n.t(:yes_text) : I18n.t(:no_text)),
                c.camp_manager.name, c.camp_manager.email, c.camp_manager.phone_number,
                c.dream_point_of_contact_name, c.dream_point_of_contact_email, c.link(),]
      end
    end
  end
end
