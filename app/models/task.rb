class Task < ApplicationRecord
  belongs_to :category
  delegate :title, to: :category, prefix: true, allow_nil: true 
  validates :title, presence: true
  validates :title, uniqueness: {scope: :category_id}, :on => :create
end
