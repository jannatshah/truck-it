class TruckPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def chinese?
    true
  end

  def indian?
    true
  end

  def burgers?
    true
  end

  def thai?
    true
  end

  def mexican?
    true
  end

  def lebanese?
    true
  end

  def italian?
    true
  end

  def kebabs?
    true
  end

  def hot_dogs?
    true
  end

  def ice_cream?
    true
  end

  def donuts?
    true
  end

  def pancakes?
    true
  end

  def brazilian?
    true
  end

  def tapas?
    true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user || user&.admin?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user || user&.admin?
  end

  def truck_orders?
    return true
  end
end
