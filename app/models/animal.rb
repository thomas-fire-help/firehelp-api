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

class Animal < ApplicationRecord
  belongs_to :user
  has_many :tag_taggables, as: :taggable
  has_many :tags, :through => :tag_taggables

  validates :email_address, presence: true
  validates :contact_name, presence: true
  validates :phone_number, presence: true

  validates :type_of_animal, presence: true
  validates :help_offered, presence: true

  validates :status, inclusion: { in: %w(available claimed archived) }

  scope :active, -> { where.not(status: "archived") }
end
