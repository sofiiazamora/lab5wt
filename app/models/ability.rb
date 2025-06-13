class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    can :create, Chat
    can [:read, :update, :destroy], Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end

    # ✅ PERMITIR leer otros usuarios para crear chats
    can :read, User

    # ✅ PERMITIR gestionar su propio perfil
    can [:update, :destroy], User, id: user.id

    # ✅ Administrador total (si lo necesitas luego)
    if user.respond_to?(:admin?) && user.admin?
      can :manage, :all
    end
  end
end
