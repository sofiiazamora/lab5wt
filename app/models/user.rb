class User < ApplicationRecord
  has_many :chats_as_sender, class_name: "Chat", foreign_key: "sender_id", dependent: :destroy
  has_many :chats_as_receiver, class_name: "Chat", foreign_key: "receiver_id", dependent: :destroy

  has_many :messages, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
