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

require 'rails_helper'
require 'faker'
I18n.reload!

describe Person do
  let(:email) { Faker::Internet.email }
  let(:creator) { User.create! email: email, password: Faker::Internet.password, ticket_id: '6687' }
  let(:firestarter) { Role.create!(:identifier => "firestarter") }

  let(:camp) do
    Camp.create!(
      :name               => 'Burn something',
      :en_name            => 'Burn something english',
      :subtitle           => 'Subtitle',
      :description        => 'We will build something and then burn it',
      :electricity        => 'Big enough for a big fire',
      :light              => 'There sill be need of good ventilation',
      :fire               => '2 to build and 3 to burn',
      :noise              => 'The fire consumes everything',
      :nature             => 'Well - it will burn....',
      :contact_email      => 'burn@example.com',
      :contact_name       => Faker::Name.name,
      :creator            => creator,
      :is_public          => true,
      :safetybag_crewsize => 3,
      :event_id           => "current_event"
    )
  end

  let!(:john) { Person.create!(
      :name                => Faker::Name.name,
      :email               => Faker::Internet.email,
      :phone_number        => Faker::PhoneNumber.phone_number,
      :needs_early_arrival => true,
      :has_ticket          => false,
      :camp_id             => camp.id,
      :roles               => [firestarter,]
    )
  }

  before :each do
    allow(Rails.application.config)
      .to receive(:default_event)
      .and_return("current_event")
  end

  describe "#displayed scop" do
    it "displays camp" do
      camp.update(camp_manager: john)
      expect(Camp.displayed).to eq([camp])
    end

    it "doesn't display manager-less camps" do
      expect(Camp.displayed).to be_empty
    end
  end

  describe "#self.to_csv" do
    before :each do
      camp.update(camp_manager: john)
    end

    context "one dream" do
      it "shows a dream from current event" do
        csv_lines = Camp.to_csv.split("\n")
        expect(csv_lines.count).to eq(2)
        expect(csv_lines.last.split(",")).to eq([
          camp.en_name, camp.id.to_s, I18n.t(:no_text),
          camp.camp_manager.name.to_s, camp.camp_manager.email.to_s, camp.camp_manager.phone_number.to_s,
          camp.dream_point_of_contact_name.to_s, camp.dream_point_of_contact_email.to_s, camp.link().to_s,])
      end

      it "won't show dreams from non current event" do
        camp.update(:event_id => "other")
        csv_lines = Camp.to_csv.split("\n")
        expect(csv_lines.count).to eq(1)
      end
    end
  end
end
