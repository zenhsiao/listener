class Listener < ApplicationRecord
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	has_many :orders 
	has_many :listener_timeships, :dependent => :destroy
	has_many :availabletimes, :through => :listener_timeships
	has_many :likeships,:dependent => :destroy
	has_many :like_users,:through => :likeships, :source => :user
end
