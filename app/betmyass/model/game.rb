
require 'betmyass/model/base_model'
require 'betmyass/model/tournament'

module BetMyAss
	module Model
		class Game < BaseModel			
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
			
			attr_accessor :id, :name, :tournaments

			def initialize(name)
				@name = name
				@tournaments = []
			end

			def createTournament(name)
				tournament = BetMyAss::Model::Tournament.new(self.id, name).save()
				@tournaments << tournament.id

				tournament
			end
		end
	end
end