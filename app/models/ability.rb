class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? 'admin'
        can :manage, :all
    elsif user.role? 'Gestor'
        can :manage, :all
    elsif user.role? 'Participante'
        can :manage, :all
    end
  end
end
