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

class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:password_digest] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:password_digest] }

  validates :phone_number, uniqueness: true, presence: true, format: { with: /\d{10}/, message: "bad format" }
  validates :username, uniqueness: true, presence: true, format: { with: /[a-zA-Z]+/, message: "must be alphanumeric" }

  has_many :supplies_neededs
end
