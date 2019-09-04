class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true,  length: { minimum: 20 }
end
