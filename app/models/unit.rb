class Unit <ActiveRecord::Base
	belongs_to :user
	has_many :jobs, dependent: :destroy
	
end