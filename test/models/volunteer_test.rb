# == Schema Information
#
# Table name: volunteers
#
#  id                     :integer          not null, primary key
#  skills                 :text
#  number_of_volunteers   :integer
#  volunteers_notes       :text
#  organization           :string
#  address                :string
#  coordinates            :string
#  contact_name           :string
#  phone_number           :string
#  email_address          :string
#  additional_information :string
#  user_id                :integer
#  status                 :string           default("available")
#  verified               :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
