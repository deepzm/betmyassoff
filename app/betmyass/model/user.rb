
require 'betmyass/model/base_model'

module BetMyAss
	module Model
		class User < BaseModel		

			##---------------------------------
			DB = {}	
			def self.all
			DB.values
			end

			def self.get(id)
				DB[id]
			end

			def self.next_id
				DB.keys.max.to_i + 1
			end

			def save(id = nil)
				self.id = id || self.class.next_id
				DB[self.id] = self
				self
			end
			##---------------------------------

			def self.authenticate (username, password)
				self.all.find { |user| user.username == username }
			end

			attr_accessor :id, :username, :password, :name

			def initialize(username)
				@username = username
			end

		 end	
	end
end
