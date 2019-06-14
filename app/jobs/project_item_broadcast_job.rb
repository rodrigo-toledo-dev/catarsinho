class ProjectItemBroadcastJob < ApplicationJob
  queue_as :default
  def perform(project_item)
    ActionCable.server.broadcast 'project_item_channel', project_detail: render_project_detail(project_item.project), content: render_project(project_item), slug: project_item.project.slug
  end

  private
    def render_project(project_item)
      ApplicationController.renderer.render(partial: 'home/project', locals: { project: project_item.project })
    end

    def render_project_detail(project)
      ApplicationController.renderer.render(partial: 'projects/show', locals: {project: project})
    end
end
