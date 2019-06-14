class ProjectItemChannel < ApplicationCable::Channel
  def subscribed
    stream_from "project_item_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def contribute(data)
    project = Project.friendly.find(data['slug'])
    project_item = project.project_items.build(email: data['email'], name: data['name'], value_to_pass: data['value_to_pass'])
    project_item.save!
  end
end
