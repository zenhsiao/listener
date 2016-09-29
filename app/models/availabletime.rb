class Availabletime < ApplicationRecord
	validates_presence_of :time_start,:time_end
	has_many :listener_timeships,  :dependent => :destroy
	has_many :listeners, :through => :listener_timeships
end

