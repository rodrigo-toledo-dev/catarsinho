class ProjectsController < ApplicationController
  def show
    @project = Project.friendly.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
