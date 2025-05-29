class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # Permite leer todo
    can :read, :all

    # Permisos para Message (como tenías)
    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    # Permisos para User
    # Por ejemplo, permitir crear y gestionar usuarios (ajusta según tu necesidad)
    can :create, User
    can [:read, :update, :destroy], User, id: user.id
  end
end
