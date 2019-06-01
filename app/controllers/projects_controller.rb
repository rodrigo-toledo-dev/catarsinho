class ProjectsController < ApplicationController
  def show
    @project = Project.friendly.find(params[:id])
    @project_item = @project.project_items.build
    respond_to do |format|
      format.js
    end
  end

end
