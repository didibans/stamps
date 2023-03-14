class StampCardPolicy < ApplicationPolicy
  def stampit?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
