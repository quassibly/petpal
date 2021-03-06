class PetPolicy < ApplicationPolicy
  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.user == user
  end

  def management?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
