class Task < ActiveRecord::Base
	has_many :tags, dependent: :destroy
	belongs_to :list

	validates :name, presence: true
	validates :list_id, presence: { message: 'not specified. Please create a new list.' }
end
