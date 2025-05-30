class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all

    # Mensajes
    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    # Chats
    can :create, Chat

    can [:read, :update, :destroy], Chat, sender_id: user.id
    can [:read, :update, :destroy], Chat, receiver_id: user.id


    # Usuarios
    can :create, User
    can [:read, :update, :destroy], User, id: user.id
  end
end
