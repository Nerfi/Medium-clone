class Picture < ApplicationRecord
  belongs_to :article
  mount_uploader :photo, PhotoUploader
end
