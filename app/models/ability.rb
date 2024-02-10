class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    return unless user

    can :manage, Category, user_id: user.id
    can :manage, UserTransaction, author_id: user.id
    can :read, Category # Allow all users to read categories
  end
end
