class HomeController < ApplicationController
  before_action :set_projects
  def index
  end

  protected
    def set_projects
      @projects = Project.order(params[:order] || :title)
    end
end
