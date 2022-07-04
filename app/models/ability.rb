class Ability
  include CanCan::Ability

  def initialize(user)
      Define abilities for the passed in user here. For example:
     
        user ||= User.new   # guest user (not logged in)
        if user.admin?
          can :create , :job
          can :update , :job
        else
         can :create , :user
         can :create , :appjob
      end
    
   
  end
end
