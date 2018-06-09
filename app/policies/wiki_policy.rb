class WikiPolicy < ApplicationPolicy
  
  def index?
  
  end  
  
  
  def destroy?
    user.admin? || user.id == record.user_id
  end
  
  
  class Scope < Scope
      attr_reader :user, :wiki 
  
    def initialize(user, wiki)
      @user = user
      @scope = scope
      
    
    end
    
    def resolve
      scope
    end
  end
end
