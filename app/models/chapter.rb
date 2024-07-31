class Chapter < ApplicationRecord
  belongs_to :manga
  
  validates :title, presence: true
  validates :link, presence: true, format: { with: URI::regexp(%w[http https]) }
end