class Chat < ApplicationRecord
    validates :sender_id, :receiver_id, presence: true
  end