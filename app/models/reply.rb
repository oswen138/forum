class Reply < ApplicationRecord
  belongs_to :discussion
  belongs_to :user
  validates :reply, presence: true
  has_many_attached :images, dependent: :destroy

  extend FriendlyId
  friendly_id :reply, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    reply_changed?
  end

end
