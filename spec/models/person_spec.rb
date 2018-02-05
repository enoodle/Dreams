require 'rails_helper'
require 'faker'
I18n.reload!

describe Person do

  let(:email) { Faker::Internet.email }
  let(:creator) { User.create! email: email, password: Faker::Internet.password, ticket_id: '6687' }
  let(:firestarter) { Role.create!(:identifier => "firestarter") }

  let(:camp) do
    Camp.create!(
      :name          => 'Burn something',
      :subtitle      => 'Subtitle',
      :description   => 'We will build something and then burn it',
      :electricity   => 'Big enough for a big fire',
      :light         => 'There sill be need of good ventilation',
      :fire          => '2 to build and 3 to burn',
      :noise         => 'The fire consumes everything',
      :nature        => 'Well - it will burn....',
      :contact_email => 'burn@example.com',
      :contact_name  => Faker::Name.name,
      :creator       => creator,
      :event_id      => "current_event"
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

  def person_to_line(p)
    [p.email, p.name, p.phone_number, p.roles.pluck(:identifier).join('|'),
     camp.name, camp.id.to_s, "Yes", "No"]
  end

  describe "#self.to_csv" do
    context "Only one person" do
      it "returns a file containing headrs and that persons information" do
        csv_lines = Person.to_csv.split("\n")
        expect(csv_lines.count).to eq(2)
        expect(csv_lines.last.split(",")).to eq(person_to_line(john))
      end
    end

    context "with two people" do
      let!(:waterblower) { Role.create!(:identifier => "waterblower") }
      let!(:nir) { Person.create!(
          :name                => Faker::Name.name,
          :email               => Faker::Internet.email,
          :phone_number        => Faker::PhoneNumber.phone_number,
          :needs_early_arrival => true,
          :has_ticket          => false,
          :camp_id             => camp.id,
          :roles               => [ firestarter, waterblower ]
        )
      }

      it "returns a line for each person" do
        csv_lines = Person.to_csv.split("\n")
        expect(csv_lines.count).to eq(3)
        expect(csv_lines.second.split(",")).to eq(person_to_line(john))
        expect(csv_lines.third.split(",")).to eq(person_to_line(nir))
      end
    end

    context "with camps from old events" do
      let!(:old_camp) do
        Camp.create!(
          :name          => 'Burn something',
          :subtitle      => 'Subtitle',
          :description   => 'We will build something and then burn it',
          :electricity   => 'Big enough for a big fire',
          :light         => 'There sill be need of good ventilation',
          :fire          => '2 to build and 3 to burn',
          :noise         => 'The fire consumes everything',
          :nature        => 'Well - it will burn....',
          :contact_email => 'burn@example.com',
          :contact_name  => Faker::Name.name,
          :creator       => creator,
          :event_id      => "current_event"
        )
      end

      let!(:nir) { Person.create!(
          :name                => Faker::Name.name,
          :email               => Faker::Internet.email,
          :phone_number        => Faker::PhoneNumber.phone_number,
          :needs_early_arrival => true,
          :has_ticket          => false,
          :camp_id             => old_camp.id,
          :roles               => [ firestarter ]
        )
      }

      it "only returns people from current event camps" do
        csv_lines = Person.to_csv.split("\n")
        expect(csv_lines.count).to eq(3)
        old_camp.update(:event_id => "old_event")
        csv_lines = Person.to_csv.split("\n")
        expect(csv_lines.count).to eq(2)
      end
    end
  end
end
