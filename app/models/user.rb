class User <ActiveRecord::Base
	has_many :posts
	has_many :jobs
	has_one :unit
    has_attached_file :avatar, :styles => { :thumb => "60x60>" }, :default_url => "/images/:style/missing.png" 
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	attr_accessor :password

	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email

	def encrypt_password
		if password.present?
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end 
		
	def self.authenticate(email, password)
		user = User.where(email:email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
		user
		else
			nil
		end 
	end 	

end