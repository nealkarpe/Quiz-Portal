class Quiz < ApplicationRecord
	has_many :attemps
	has_many :users, through: :attemps	
	has_many :questions
	validates :name, presence: true
end
