class HomeController < ApplicationController
  before_action :authenticate_user!, only: %i[ profile ]
  def index
    redirect_to :courses
  end

  def profile
    user = User.find(current_user.id)
    @courses = user.courses
  end

  def teacher
    begin
      authorize Course, policy_class: HomePolicy
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
    @courses = Course.where(owner: current_user.id)
  end
end
