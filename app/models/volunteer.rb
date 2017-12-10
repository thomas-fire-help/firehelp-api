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

class Volunteer < ApplicationRecord
  belongs_to :user
  has_many :tag_taggables, as: :taggable
  has_many :tags, :through => :tag_taggables

  validates :email_address, presence: true
  validates :phone_number, presence: true
  validates :contact_name, presence: true
  validates :skills, presence: true
  validates :number_of_volunteers, presence: true
  validates :address, presence: true
  validates :coordinates, presence: true
  validates :status, inclusion: { in: %w(available claimed archived) }

  scope :active, -> { where.not(status: "archived") }
end
