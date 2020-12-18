class Discussion < ApplicationRecord

  belongs_to :channels
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, :content, presence: true
  
end
