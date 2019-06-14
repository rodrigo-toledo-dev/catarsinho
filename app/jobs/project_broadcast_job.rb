class ProjectBroadcastJob < ApplicationJob
  queue_as :default
  def perform(project)
    logger.info "-----------------------------------"
    logger.info project.inspect
    ActionCable.server.broadcast 'project_channel', content: render_project(project), slug: project.slug
  end

  private
    def render_project(project)
      ApplicationController.renderer.render(partial: 'home/project', locals: { project: project })
    end
end
