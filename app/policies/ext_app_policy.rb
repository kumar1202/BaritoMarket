class ExtAppPolicy < ApplicationPolicy
  def index?
    barito_superadmin?
  end

  def show?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end

  def regenerate_token?
    index?
  end
end
