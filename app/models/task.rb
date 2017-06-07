class Task < ApplicationRecord
	belongs_to :taskbox
	validates :name, presence: true
end
