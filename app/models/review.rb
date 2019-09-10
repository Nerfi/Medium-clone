class Review < ApplicationRecord
  belongs_to :article
  validates :content, length: { minimum: 10 }
end
