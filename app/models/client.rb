class Client < ActiveRecord::Base
	belongs_to :agent
	validates :mt4_id, presence: true, length: { minimum: 6 }
end
