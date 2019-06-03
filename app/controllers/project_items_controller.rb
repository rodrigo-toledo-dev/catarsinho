class ProjectItemsController < ApplicationController
  def create
    @project = Project.friendly.find(params[:project_id])
    @project_item = @project.project_items.build(project_item_params)
    respond_to do |format|
      if @project_item.save
        format.js { render 'create' }
      else
        format.js { render 'error' }
      end
    end
  end

  protected
    def project_item_params
      params.require(:project_item).permit(:email, :name, :value_to_pass)
    end
end
