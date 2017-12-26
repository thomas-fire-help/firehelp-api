# == Schema Information
#
# Table name: housings
#
#  id             :integer          not null, primary key
#  city           :string
#  beds           :integer
#  length_of_stay :string
#  child_friendly :boolean
#  kid_notes      :text
#  pets_accepted  :boolean
#  pet_notes      :text
#  contact_name   :string
#  phone_number   :string
#  email_address  :string
#  notes          :text
#  user_id        :integer
#  status         :string           default("available")
#  verified       :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  paid           :boolean
#  neighborhood   :string
#  housing_type   :string
#  has_animals    :boolean
#  price          :string
#

class Housing < ApplicationRecord
  belongs_to :user
  has_many :tag_taggables, as: :taggable
  has_many :tags, :through => :tag_taggables

  validates :email_address, presence: true
  validates :phone_number, presence: true
  validates :city, presence: true
  validates :beds, presence: true
  validates :paid, inclusion: { in: [ true, false ] }
  validates :has_animals, inclusion: { in: [ true, false ] }
  validates :contact_name, presence: true
  validates :length_of_stay, presence: true, inclusion: { in: %w(short long permanent) }
  validates :housing_type, presence: true, inclusion: { in: %w(house room) }
  validates :child_friendly, inclusion: { in: [ true, false ] }
  validates :pets_accepted, inclusion: { in: [ true, false ] }
  validates :status, inclusion: { in: %w(available claimed archived) }

  scope :active, -> { where.not(status: "archived") }
  scope :by_tag, ->(tag) { joins(:tags).where("tags.name = ? AND tags.category = ?", tag, "housing") }
end
