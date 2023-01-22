class StoryPolicy < EditOwnPolicy

  def edit?
    (member == record.member) or member.admin?
  end
  alias :update? :edit?
  alias :destroy? :edit?

end
