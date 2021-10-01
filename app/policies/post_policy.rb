class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user_is_owner_of_record? || user.admin?
  end

  def destroy?
    user_is_owner_of_record? || user.admin?
  end

  def user_is_owner_of_record?
    user == @record.user
  end
end
