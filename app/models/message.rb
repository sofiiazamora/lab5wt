class Message < ApplicationRecord
    validates :chat_id, :user_id, :body, presence: true
  end