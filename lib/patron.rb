class Patron

	attr_reader :intoxication
	attr_accessor :wounds

	def initialize
		@intoxication = []
		@wounds = 0
	end

	def drunk?
		intoxication_level >= 10
	end

	def paralytic?
		intoxication_level >= 15
	end

	def enter(pub)
		pub.admit(self)
	end

	def leave(pub)
		pub.expel(self)
	end

	def move(pub1, pub2)
		pub1.expel(self)
		pub2.admit(self)
	end

	def down(pint)
		unless pint.empty?
			@intoxication << pint 
			pint.empty!
		end
	end

	def intoxication_level
		intoxication.count
	end

	def glass(patron)
		raise "Alright, that's enough now." if patron.hospitalized?
		patron.wounds += 1
	end

	def hospitalized?
		wounds >= 3
	end

end