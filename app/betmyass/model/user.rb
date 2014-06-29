

module BetMyAss
	module Model
		class User 

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

			def self.authenticate (username, password)
				self.all.find { |user| user.username == username }
			end

			def save(id = nil)
				self.id = id || self.class.next_id
				DB[self.id] = self
			end

			attr_accessor :id, :username, :password, :name

			def initialize(username)
				@username = username
			end

		 end	
	end
end


BetMyAss::Model::User.new("bravo").save
BetMyAss::Model::User.new("johny").save
BetMyAss::Model::User.new("tim").save
BetMyAss::Model::User.new("tony").save

# p BetMyAss::Model::User.all.find { |user| user.username == "tim" }
# p BetMyAss::Model::User.get(2)