class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 40 }
	validates :email, presence: true
end
