#!/usr/local/bin/ruby -w

TEAMS = [
						"Matches Malone",
						"The Fantastic Four",
						"The Post-Immortals",
						"Jack Vs Rajnikanth",
						"Illuminati"
				]

puts "============================================="
puts TEAMS[Random.rand(0..(TEAMS.size - 1))]
puts "============================================="

