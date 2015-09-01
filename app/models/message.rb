class Message < ActiveRecord::Base
	belongs_to :user

	validates :content, presence: true,
		uniqueness: { case_sensitive: false }

end