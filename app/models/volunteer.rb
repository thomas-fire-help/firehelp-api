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
#  volunteer_type         :string
#  location               :string
#

class Volunteer < ApplicationRecord
  belongs_to :user
  has_many :tag_taggables, as: :taggable
  has_many :tags, :through => :tag_taggables

  validates :email_address, presence: true
  validates :phone_number, presence: true
  validates :contact_name, presence: true
  validates :skills, presence: true
  validates :status, inclusion: { in: %w(available claimed archived) }
  validates :volunteer_type, inclusion: { in: %w(organization personal) }
  validate :conditional_requirements

  scope :active, -> { where.not(status: "archived") }
  scope :by_tag, ->(tag) { joins(:tags).where("tags.name = ? AND tags.category = ?", tag, "volunteer") }

  private
  def conditional_requirements
    case volunteer_type
    when 'organization'
      # Verify Organization Exists
      errors.add(:organization, "is required")         if organization.blank?
      errors.add(:address, "is required")              if address.blank?
      errors.add(:number_of_volunteers, "is required") if number_of_volunteers.blank?
      errors.add(:volunteers_notes, "is required")     if volunteers_notes.blank?
      # Verify Personal Doesn't Exist
      errors.add(:location, "cannot be set on volunteer_type 'organization'") if location
    when 'personal'
      # Verify Personal Exists
      errors.add(:location, "is required") if location.blank?
      # Verify Organization Doesn't Exists
      errors.add(:organization, "cannot be set on volunteer_type 'organization'")         if organization
      errors.add(:address, "cannot be set on volunteer_type 'organization'")              if address
      errors.add(:number_of_volunteers, "cannot be set on volunteer_type 'organization'") if number_of_volunteers
      errors.add(:volunteers_notes, "cannot be set on volunteer_type 'organization'")     if volunteers_notes
    end
  end
end
