class StampCardPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    true
  end

  def stampit?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
