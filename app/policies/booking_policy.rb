class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return true
  end

  def destroy?
    user == record.user
  end

  def accept?
    record.offer.user == user
  end

  def deny?
    record.offer.user == user
  end

end
