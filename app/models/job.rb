class Job <ActiveRecord::Base
	belongs_to :units 
	belongs_to :user
end
