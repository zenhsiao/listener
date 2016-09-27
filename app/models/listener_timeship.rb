class ListenerTimeship < ApplicationRecord
	belongs_to :listener
	belongs_to :availabletime
	belongs_to :order, :optional => true
	scope :unorder, -> { where( :order_id => nil ) }
end
