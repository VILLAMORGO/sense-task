class Category < ApplicationRecord
    belongs_to :account
    has_many :tasks
    validates :title, presence: true
    validates :title, uniqueness: {scope: :title}, :on => :create
end
