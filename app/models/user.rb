class User < ActiveRecord::Base
	has_many :lists, dependent: :destroy

	validates :password_confirmation, presence: true

	validates :username, uniqueness: true
  	validates_confirmation_of :password

  	validates :password, length: {
  		minimum: 6
  	}

  	validates :username, length: {
  		minimum: 6
  	}



end
