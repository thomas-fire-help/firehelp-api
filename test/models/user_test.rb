# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  crypted_password                :string
#  salt                            :string
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_sent_at          :datetime
#  phone_number                    :string
#  username                        :string
#  verified                        :boolean          default(FALSE)
#  role                            :string
#  pin                             :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
