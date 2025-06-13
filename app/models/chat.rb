class Chat < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_many :messages, dependent: :destroy

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validate :different_sender_and_receiver

  # Scope para traer chats donde el usuario es sender o receiver
  scope :involving, ->(user) do
    where("sender_id = :user_id OR receiver_id = :user_id", user_id: user.id)
  end

  # Método para obtener el otro participante del chat
  def other_user(current_user)
    current_user == sender ? receiver : sender
  end

  private

  def different_sender_and_receiver
    errors.add(:receiver_id, "must be different from sender") if sender_id == receiver_id
  end
end
