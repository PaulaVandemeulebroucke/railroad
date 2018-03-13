class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create?
  end

  def edit?
    is_user_the_creator?
  end

  def create?
    return true
  end

  def update?
    is_user_the_creator?
  end

  def destroy?
    is_user_the_creator?
  end

  private

  def is_user_the_creator?
    record.user == user
    # - offer: the offer passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end
end
