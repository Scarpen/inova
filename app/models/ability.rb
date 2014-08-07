class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? 'Admin'
        can :manage, :all
    elsif user.role? 'Manager'
        can :manage, :all
    elsif user.role? 'Partaker'
        can :manage, :all
    end
  end
end
