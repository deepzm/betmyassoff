$LOAD_PATH << 'app'

require 'rubygems'
require 'bundler'
Bundler.require


require 'betmyass/handlers'

## setup
require 'betmyass/model/user'
require 'betmyass/model/game'
require 'betmyass/model/tournament'
require 'betmyass/model/team'

class Fixnum

	def hours 
		self * 60 * 60
	end
end

## data setup
fifaWorldCup = BetMyAss::Model::Game.new("Football")
				.save
				.createTournament("FIFIA World cup 2014")

fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("Brazil"),
	fifaWorldCup.addTeam("Chile"),
	Time.utc(2014, 06, 28, 13) + 3.hours)

fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("Colombia"),
	fifaWorldCup.addTeam("Uruguay"),
	Time.utc(2014, 06, 28, 17) + 3.hours)
	
fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("Netherlands"),
	fifaWorldCup.addTeam("Mexico"),
	Time.utc(2014, 06, 28, 13) + 3.hours)

fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("Costa Rica"),
	fifaWorldCup.addTeam("Greece"),
	Time.utc(2014, 06, 28, 17) + 3.hours)

fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("France"),
	fifaWorldCup.addTeam("Nigeria"),
	Time.utc(2014, 06, 28, 13) + 3.hours)

fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("Germany"),
	fifaWorldCup.addTeam("Algeria"),
	Time.utc(2014, 06, 28, 17) + 3.hours)

fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("Argentina"),
	fifaWorldCup.addTeam("Switzerland"),
	Time.utc(2014, 06, 28, 13) + 3.hours)

fifaWorldCup.newMatch(
	fifaWorldCup.addTeam("Belgium"),
	fifaWorldCup.addTeam("United States"),
	Time.utc(2014, 06, 28, 17) + 3.hours)


BetMyAss::Model::User.new("bravo").save
BetMyAss::Model::User.new("johny").save
BetMyAss::Model::User.new("tim").save
BetMyAss::Model::User.new("tony").save