class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :phone_number, uniqueness: true, presence: true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates :username, uniqueness: true, presence: true, format: { with: /[a-zA-Z]+/, message: "must be alphanumeric" }

  has_many :supplies_neededs
end
