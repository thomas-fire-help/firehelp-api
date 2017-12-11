# == Schema Information
#
# Table name: uploads
#
#  id              :integer          not null, primary key
#  key             :string
#  uploadable_id   :integer
#  uploadable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Upload < ApplicationRecord
  belongs_to :uploadable, polymorphic: true
  validates :key, presence: true

  def url(type)
    storage.get_object_url('thomas-fire-help', "#{type}/#{key}", 30.minutes.from_now.to_time.to_i, options = {})
  end
end
