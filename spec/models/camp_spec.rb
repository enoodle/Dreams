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
    context "one dream" do
      it "shows a dream from current event" do
        csv_lines = Camp.to_csv.split("\n")
        expect(csv_lines.count).to eq(2)
        expect(csv_lines.last.split(",")).to eq([camp.en_name,
                                                 camp.id.to_s,
                                                 camp.safetybag_crewsize.to_s])
      end

      it "won't show dreams from non current event" do
        camp.update(:event_id => "other")
        csv_lines = Camp.to_csv.split("\n")
        expect(csv_lines.count).to eq(1)
      end
    end
  end
end
