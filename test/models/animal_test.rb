# == Schema Information
#
# Table name: animals
#
#  id                     :integer          not null, primary key
#  type_of_animal         :string
#  help_offered           :text
#  city                   :string
#  organization           :string
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

class AnimalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
