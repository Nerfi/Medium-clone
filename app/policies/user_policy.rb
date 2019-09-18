class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
     scope..where.not(id: user.id)


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
