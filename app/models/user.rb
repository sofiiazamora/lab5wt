class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chats_as_sender, class_name: "Chat", foreign_key: "sender_id", dependent: :destroy
  has_many :chats_as_receiver, class_name: "Chat", foreign_key: "receiver_id", dependent: :destroy

  has_many :messages, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

       
  def full_name
    "#{first_name} #{last_name}".strip
  end
end
