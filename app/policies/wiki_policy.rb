class WikiPolicy < ApplicationPolicy
  
  class Scope < Scope
      attr_reader :user, :scope 
  
    def initialize(user, scope)
      @user = user
      @scope = scope
    
    end
    
    def resolve
      scope
    end
  end
  
  def destroy?
    user.admin? || user.id == record.user_id
  end
end
