class ProjectsController < ApplicationController
  def show
    @project = Project.friendly.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def new
    @project = Project.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      logger.info "================= salvou"
      logger.info @project.inspect
    else
      logger.info "================= nao foi"
      logger.info @project.errors.inspect
    end
    redirect_to root_path
  end

  protected
    def project_params
      params.require(:project).permit(:title, :description, :image, :value_to_get)
    end
end
