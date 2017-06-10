class Taskbox < ApplicationRecord
	has_many :tasks
	belongs_to :user
	validates :name, presence: true
	has_ancestry
end
