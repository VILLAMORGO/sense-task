class Task < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :title, uniqueness: { scope: :category_id}
end
