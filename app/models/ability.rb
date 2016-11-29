class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.webmaster?
      alias_action :read, :update, :to => :ru
      can :ru, User, :id => user.id
      can :manage, Static
      can :manage, Task
      # unless user.sub_accounts.empty?
      #   can :manage, Statistic, :user_id => user.id, :sub_id => user.sub_accounts.first.id
      # else
      #   can :manage, Statistic, :user_id => user.id
      # end
      # can :manage, SubAccount, :user_id => user.id
    #else
      #TODO Guest have to read root page (unless redirect loop)
      #can :read, :all
    end
  end
end
