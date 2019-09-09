class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true , uniqueness: true
  validates :description, presence: true

  mount_uploader :photo, PhotoUploader
end
