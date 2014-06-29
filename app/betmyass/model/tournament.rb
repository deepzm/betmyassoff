
require 'betmyass/model/base_model'
require 'betmyass/model/team'
require 'betmyass/model/match'

module BetMyAss
	module Model
		class Tournament < BaseModel		
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

				
			attr_accessor :id, :name, :game_id, :teams, :matches

			def initialize(game, name)
				@name = name
				@game_id = game
				@teams = []
				@matches = []
			end

			def addTeam(name) 
				team = BetMyAss::Model::Team.new(self.id, name).save
				@teams << team.id

				team
			end

			def newMatch(teamOne, teamTwo, timeUTC) 
				match = BetMyAss::Model::Match.new(self.id, teamOne.id, teamTwo.id, timeUTC)
				@matches << match.id

				match
			end

		end
	end
end