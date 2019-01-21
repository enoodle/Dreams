# == Schema Information
#
# Table name: tickets
#
#  id      :integer          not null, primary key
#  id_code :text
#  email   :string(64)       default(""), not null
#

class Ticket < ActiveRecord::Base
end
