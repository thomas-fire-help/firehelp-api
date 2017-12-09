# == Schema Information
#
# Table name: supplies_neededs
#
#  id                   :integer          not null, primary key
#  organization         :string
#  drop_off_location    :string
#  phone_number         :string
#  drop_off_hours       :string
#  email_address        :string
#  direct_donations     :string
#  items                :string
#  special_instructions :string
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class SuppliesNeeded < ApplicationRecord
  belongs_to :user

  validates :email_address, presence: true
  validates :drop_off_location, presence: true
  validates :phone_number, presence: true
  validates :drop_off_hours, presence: true
  validates :items, presence: true
  validates :direct_donations, presence: true
end
