class Job <ActiveRecord::Base
	belongs_to :units through: :users
end
