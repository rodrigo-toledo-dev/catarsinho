class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :image
  has_many :project_items

  def value_missing
    begin
      value_to_get - project_items.sum(:value_to_pass)
    rescue => exception
      value_to_get
    end
  end
end
