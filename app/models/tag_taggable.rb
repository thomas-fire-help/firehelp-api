# == Schema Information
#
# Table name: tag_tagabbles
#
#  id            :integer          not null, primary key
#  taggable_id   :integer
#  taggable_type :string
#  tag_id        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TagTaggable < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag
end
