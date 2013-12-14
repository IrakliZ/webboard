class Board < ActiveRecord::Base
	belongs_to :user
  validates :title, presence: true, length: { maximum: 40 }
	validates :user_id, presence: true
end
