class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can [:current], User
    can :read, Doctor
    can(:manage, Reservation, user:)

    return unless user.role == 'admin'

    can :manage, Doctor
  end
end
