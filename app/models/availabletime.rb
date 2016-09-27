class Availabletime < ApplicationRecord
	has_many :listener_timeships,  :dependent => :destroy
	has_many :listeners, :through => :listener_timeships
end

