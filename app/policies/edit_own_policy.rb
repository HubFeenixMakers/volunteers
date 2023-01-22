# allows to edit/detroy own data
# which can be viewed by anyone
class EditOwnPolicy < ApplicationPolicy
  def edit?
    return true if member.admin?
    owner?
  end
  def owner?
    member == record.member
  end
  alias :update? :edit?
  alias :destroy? :edit?

end
