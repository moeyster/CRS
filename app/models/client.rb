class Client < ActiveRecord::Base
	belongs_to :agent
	validates :mt4_id, presence: true, length: { minimum: 6 }

	def self.search(query)
		where("name like?", "%#{query}%")
	end
end
