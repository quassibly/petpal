class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def show
      true
    end

    def update
      true
    end
  end
end
