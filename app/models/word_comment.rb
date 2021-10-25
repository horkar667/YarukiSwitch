class WordComment < ApplicationRecord
  belongs_to :user
  belongs_to :word
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true
end
