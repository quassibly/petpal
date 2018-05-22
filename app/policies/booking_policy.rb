class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(record.user == @user)
    end

    def index
      @record.user == @user
    end

    def show
      @

  end
end
