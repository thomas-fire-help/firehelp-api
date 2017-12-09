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

require 'test_helper'

class SuppliesNeededTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
