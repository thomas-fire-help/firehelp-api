# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#

class Tag < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :category }
  validates :category, presence: true, inclusion: { in: %w(housing volunteer) }
  has_many :tag_taggables
  has_many :taggables, through: :tag_taggables

  def self.filter_by_category(category)
    if category
      where(category: category)
    else
      all
    end
  end
end
