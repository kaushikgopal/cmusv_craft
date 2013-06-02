#!/usr/local/bin/ruby -w

TEAMS = [		"Matches Malone",
						"The Fantastic Four",
						"The Post-Immortals",
						"Jack Vs Rajnikanth",
						"Illuminati"
				]


teams_hash = {}

TEAMS.each_with_index do |team_name, index|
	teams_hash[index] = team_name
end

random_int = (Random.rand(0..(TEAMS.length-1)))
puts "============================================="
puts "\"#{teams_hash[random_int]}\"  (#{random_int})"
puts "============================================="