class AdminAbility
  include CanCan::Ability

  def initialize(admin)
    if admin.roles.map { |r| r.name }.include?(Role::SUPER_ADMIN)
      can :manage, :all
    else
      admin.flatten_permissions.each do |permission|
        unless permission.non_model
          #can permission.action.to_sym, permission.object_type.constantize do |object|
            #object.nil? || permission.object_id.nil? || permission.object_id == object.id
          #end
          can permission.action.to_sym, permission.object_type.constantize
        else
          can permission.action.to_sym, permission.object_type.downcase.to_sym
        end
      end
      #can :read, :dashboard # authorize for non-resourceful controller 
    end
  end
end
