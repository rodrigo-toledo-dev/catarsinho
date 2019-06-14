class Api::ProjectsController < Api::ApplicationController
  def index
    projects = Project.includes(:project_items).order(updated_at: :desc)

    render json: projects.as_json
  end

  def update
    project = Project.friendly.find(params[:id])
    project_item = project.project_items.build(project_item_params)
    respond_to do |format|
      if project_item.save
        project.reload
        render json: {status: :ok, project: project.as_json}
      else
        render json: {status: :error, errors: project_item.errors.to_json}
      end
    end
  end

  protected
    def project_item_params
      params.require(:project_item).permit(:value_to_pass, :email, :name)
    end
end
