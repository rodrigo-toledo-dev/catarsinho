class Project < ApplicationRecord
  attr_accessor :value_missing
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :image
  has_many :project_items
  validates :title, :image, :description, :value_to_get, presence: true
  after_create_commit :perform_real_time


  def as_json(options = {})
    { title: self.title, description: self.description, value_to_get: self.value_to_get, slug: self.slug, value_missing: self.value_missing, image: Rails.application.routes.url_helpers.rails_blob_url(self.image, only_path: false) }
  end

  def value_missing
    begin
      value_to_get - project_items.sum(:value_to_pass)
    rescue => exception
      value_to_get
    end
  end

  def perform_real_time
    ProjectBroadcastJob.perform_later self
  end
end
