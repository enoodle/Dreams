require 'rails_helper'
require 'faker'
I18n.reload!

describe CampMailer, type: :mailer do
  let(:email) { Faker::Internet.email }
  let(:user) { User.create! email: email, password: Faker::Internet.password, ticket_id: '6687' }
  let(:camp_attributes){
    {
        :name                 => 'Burn something',
        :subtitle             => 'Subtitle',
        :description          => 'We will build something and then burn it',
        :electricity          => 'Big enough for a big fire',
        :light                => 'There sill be need of good ventilation',
        :fire                 => '2 to build and 3 to burn',
        :noise                => 'The fire consumes everything',
        :nature               => 'Well - it will burn....',
        :safety_file_comments => 'don\'t burn burners',
        :contact_email        => 'burn@example.com',
        :contact_name         => Faker::Name.name,
    }
  }
  let(:camp) { Camp.create!(camp_attributes.merge(creator: user)) }

  context '#safety_comments_updated' do
    it 'renders mails successfully' do
      mail = described_class.safety_comments_updated(camp, user)
      expect(mail.to).to include(camp.creator.email)
      expect(mail.to).to include(user.email)
    end
  end
end
