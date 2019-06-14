class ProjectItem < ApplicationRecord
  belongs_to :project
  validates :email, :value_to_pass, presence: true
  validates :value_to_pass, price: true
  after_create_commit { ProjectItemBroadcastJob.perform_later self }
end
