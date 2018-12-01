class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true
  validates :user_id, presence: true
  validates :channel_id, presence: true
  validates :author, presence: true
end
