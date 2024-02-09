class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user
      can :manage, Category, user_id: user.id
      can :manage, UserTransaction, author_id: user.id
    end
  end
end
