class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :taggable, polymorphic: true
end
