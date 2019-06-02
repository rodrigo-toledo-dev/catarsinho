class ProjectItemsController < ApplicationController
  def create
    @project = Project.friendly.find(params[:project_id])
    @project_item = @project.project_items.build(project_item_params)
    @project_item.save
    logger.info @project_item.errors.inspect
    respond_to do |format|
      format.js
    end
  end

  protected
    def project_item_params
      params.require(:project_item).permit(:email, :name, :value_to_pass)
    end
end
