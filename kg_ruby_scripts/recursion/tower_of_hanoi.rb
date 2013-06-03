# nice explanation here http://www.youtube.com/watch?v=Ny2xFwgZmI0 (in hindi though)
def solve_tower_of_hanoi(n, source_peg, destination_peg, temporary_peg)
	# Base case
	if n == 1
		move_one_disc(source_peg, destination_peg)
	else
		# move n-1 discs from source to temporary
		solve_tower_of_hanoi(n-1, source_peg, temporary_peg, destination_peg)
		# move one disc from source to destination
		move_one_disc(source_peg, destination_peg)
		# move n-1 discs from temporary to destination
		solve_tower_of_hanoi(n-1, temporary_peg, destination_peg, source_peg)
	end
end

def move_one_disc(source_peg, destination_peg)
	puts "Move one disc from #{source_peg} to #{destination_peg}"
end

solve_tower_of_hanoi(3, "A", "B", "C")
solve_tower_of_hanoi(4, "A", "B", "C")