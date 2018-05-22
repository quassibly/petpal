class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      record.user == user
    end

    def index
      true
    end

    def show
      @record.user == @user
    end

    def create
      true
    end

    def update
      @record.user == @user
    end

    def destroy
      @record.user == @user
    end
  end
end
