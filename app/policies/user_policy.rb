class UserPolicy < ApplicationPolicy
  def qr_code?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
