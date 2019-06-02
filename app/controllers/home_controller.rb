class HomeController < ApplicationController
  before_action :set_projects
  def index
  end

  protected
    def set_projects
      @projects = Project.order(value_to_get: :desc)
    end
end
