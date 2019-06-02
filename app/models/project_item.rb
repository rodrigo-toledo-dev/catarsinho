class ProjectItem < ApplicationRecord
  belongs_to :project
  validates :email, :value_to_pass, presence: true
end
