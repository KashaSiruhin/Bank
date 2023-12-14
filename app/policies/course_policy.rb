class CoursePolicy < ApplicationPolicy
  attr_reader :user, :course

  def initialize(user, course)
    @user = user
    @course = course
  end

  def create?
    @user.teacher?
  end

  def update?
    @user.teacher? && @course.owner == @user.id
  end

  def destroy?
    @user.teacher? && @course.owner == @user.id
  end
end
