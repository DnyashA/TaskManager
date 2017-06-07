class Taskbox < ApplicationRecord
	has_many :tasks
	validates :name, presence: true
	has_ancestry
end
