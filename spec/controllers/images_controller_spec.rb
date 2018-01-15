require 'rails_helper'
require 'faker'
I18n.reload!

describe ImagesController do
  render_views
  let(:email) { Faker::Internet.email }
  let(:user) { User.create! email: email, password: Faker::Internet.password, ticket_id: '6687' }
  let(:camp_leader) { Faker::Name.name }
  let(:attachment) { Rails.root + 'public/images/bsb_placeholder_square.jpg' }

  let(:camp_attributes){
    {
        name: 'Burn something',
        subtitle: 'Subtitle',
        description: 'We will build something and then burn it',
        contact_name: camp_leader
    }
  }

  let(:camp) { Camp.create!(camp_attributes.merge(creator: user)) }

  before :each do
    sign_in user
  end

  describe '#index' do
    it 'renders camp images when no images a are present' do
      get :index, :camp_id => camp.id
      expect(response).to have_http_status(:success)
    end

    context 'when camp has an image' do
      let!(:image) { Image.create(:camp_id => camp.id) }

      before :each do
        camp.update(:default_image => image)
      end

      it 'renders camp images when one images is present' do
        get :index, :camp_id => camp.id
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe '#create' do
    it 'will not allow creating an image with out attachment' do
      post :create, { :camp_id => camp.id}
      expect(controller.request.flash[:alert]).to_not be_nil
      expect(Image.all.count).to eq(0)
    end

    it 'will set the first image as default_image for the camp' do
      post :create, {:attachment => {:file => File.new(attachment), :content_type => "image/jpg"}, :camp_id => camp.id}
      cmp = Camp.find(camp.id) # refresh the object
      expect(cmp.default_image).to_not be_nil
      expect(Image.first.id).to eq(cmp.default_image.id)
    end

    it 'will not set the second image as default_image for the camp' do
      post :create, {:attachment => {:file => File.new(attachment), :content_type => "image/jpg"}, :camp_id => camp.id}
      camp.reload
      expect(Image.first.id).to eq(camp.default_image.id)
      first_image_id = camp.default_image.id
      post :create, {:attachment => {:file => File.new(attachment), :content_type => "image/jpg"}, :camp_id => camp.id}
      camp.reload
      expect(Image.first.id).to eq(camp.default_image.id)
    end
  end

  context 'with existing images' do
    let!(:image1) { Image.create(:camp_id => camp.id) }
    let!(:image2) { Image.create(:camp_id => camp.id) }

    before :each do
      camp.update(:default_image => image1)
    end

    describe '#destroy' do
      it 'will destoy an image' do
        expect(Image.where(:camp_id => camp.id).length).to eq(2)
        post :destroy, :id => image2.id, :camp_id => camp.id
        expect(Image.where(:camp_id => camp.id).length).to eq(1)
        expect(Camp.find(camp.id).default_image_id).to eq(image1.id)
      end

      it 'will set another image as default if it was destroyed' do
        post :destroy, :id => image1.id, :camp_id => camp.id
        expect(Camp.find(camp.id).default_image_id).to eq(image2.id)
      end
    end

    describe '#set_default_image' do
      it 'will set an image as default' do
        expect(Camp.find(camp.id).default_image_id).to eq(image1.id)
        post :set_default_image, :id => image2.id, :camp_id => camp.id
        expect(Camp.find(camp.id).default_image_id).to eq(image2.id)
      end

      it 'will flash alert if image is not existing' do
        post :set_default_image, :id => image2.id+100, :camp_id => camp.id
        expect(Camp.find(camp.id).default_image_id).to eq(image1.id)
        expect(controller.request.flash[:alert]).to_not be_nil
      end

      it 'will not set an image as default if it does not belong to the camp' do
        other_camp = Camp.create(camp_attributes.merge(creator: user))
        other_image = Image.create(:camp_id => other_camp.id)
        post :set_default_image, :id => other_image.id, :camp_id => camp.id
        expect(Camp.find(camp.id).default_image_id).to eq(image1.id)
        expect(controller.request.flash[:alert]).to_not be_nil
      end
    end
  end
end
