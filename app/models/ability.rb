class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new()
    can :access, :rails_admin       # only allow admin users to access Rails Admin
    can :dashboard
    can :read, :all
    if user.id == 1
      can :manage, :all
    else
      member = Member.includes(:roles).find_by("user_id = ?",user.id)
      member.roles.each do |r|
        r.permissions.each do |p|
          begin
            action = p.action.to_sym
            subject = begin
                        # RESTful Controllers
                        p.subject.camelize.constantize
                      rescue
                        p.subject.underscore.to_sym
                      end
            can action, subject
          rescue => e
            Rails.logger.info "#{e}"
            Rails.logger.info "#{subject}"
          end
        end
      end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
