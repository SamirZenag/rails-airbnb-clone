class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def create?
    record.user == user
  end

  def accept?
    record.car.user == user
  end

  def decline?
    record.car.user == user
  end

end
