class Likeship < ApplicationRecord
	belongs_to :user
	belongs_to :listener
end
