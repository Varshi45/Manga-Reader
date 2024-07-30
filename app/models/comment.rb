class Comment < ApplicationRecord
  belongs_to :manga
  belongs_to :user

  validates :content, presence: true
end
