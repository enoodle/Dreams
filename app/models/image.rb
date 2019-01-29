# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  camp_id                 :integer
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#

class Image < ActiveRecord::Base
  # Add paperclip for S3
  has_attached_file :attachment, {
                      styles: {
                        thumb: '100x100>',
                        square: '324x222#',
                        small: '335x257>',
                        medium: '700x700>',
                        large: '2000x2000>'
                      },
                      :convert_options => {
                        :all => "-quality 95 -interlace Plane"
                      }
                    }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
