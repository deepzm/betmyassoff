
require 'betmyass/model/base_model'

module BetMyAss
	module Model
		class Team < BaseModel		
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

				
			attr_accessor :id, :name, :tournament_id

			def initialize(tournament, name)
				@tournament_id = tournament
				@name = name
			end
		end
	end
end