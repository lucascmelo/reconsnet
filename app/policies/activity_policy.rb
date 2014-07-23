class ActivityPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user and (user.admin? or user.volunteer?)
        scope.all
      else
        scope.where.not(internal_only: true).all
      end
    end
  end

  def calendar?
    true
  end

  def emails?
    true
  end

end