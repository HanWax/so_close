class Miss < ActiveRecord::Base
	belongs_to :user
	belongs_to :neighbour, :class_name => 'User'
end
