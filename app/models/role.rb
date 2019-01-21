# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  identifier :string
#

class Role < ActiveRecord::Base
  has_and_belongs_to_many :people
end
