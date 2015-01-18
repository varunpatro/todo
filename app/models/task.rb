class Task < ActiveRecord::Base
	has_many :tags, dependent: :destroy
	belongs_to :list
end
