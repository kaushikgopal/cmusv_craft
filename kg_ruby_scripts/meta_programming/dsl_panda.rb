# ====================
# using instance_eval
# ====================
class Panda1
	def self.feed &block
		panda = Panda1.new
		panda.instance_eval(&block)
	end
	def nom food
		puts "instance_eval chomp chomp .... digesting #{food.to_s} "
	end
end


# Implement this DSL

Panda1.feed {
  nom :bamboo
  nom :chocolate
}


# ===========
# using yield
# ===========
class Panda
	def self.feed
    yield Panda.new
  end
	def nom food
		puts "yield chomp chomp .... digesting #{food.to_s} "
	end
end

# finally we want to run this code
Panda.feed do |p|
	p.nom :bamboo
	p.nom :chocolate
end


