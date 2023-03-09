class StampCardTemplatePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    record.shop.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
