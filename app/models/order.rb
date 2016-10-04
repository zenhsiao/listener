class Order < ApplicationRecord
	belongs_to :user
	belongs_to :listener
	has_many :listener_timeships
	has_many :payments
end
