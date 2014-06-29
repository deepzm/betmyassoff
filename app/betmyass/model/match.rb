
require 'betmyass/model/base_model'
require 'betmyass/model/tournament'

module BetMyAss
	module Model
		class Match < BaseModel		
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
				
			attr_accessor :id, :tournament_id, :teamOne_id, :teamTwo_id, :time

			def initialize(tournament, teamOne, teamTwo, time)
				@tournament_id = tournament
				@teamOne_id = teamOne
				@teamTwo_id = teamTwo
				@time = time
			end

			
		end
	end
end