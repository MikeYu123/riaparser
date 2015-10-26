class Article < ActiveRecord::Base
  belongs_to :category
  validates :link, uniqueness: true
  validates :title, presence: true
end
