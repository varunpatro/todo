class Task < ActiveRecord::Base
	belongs_to :list
	has_many :tags

	validates :name, presence: true
	validates :list_id, presence: true, numericality: { only_integer: true}
end
