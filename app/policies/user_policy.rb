class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      return true

    end



    def follow?
       true

    end

    def unfollow?
        return follow?

    end



  end
end
