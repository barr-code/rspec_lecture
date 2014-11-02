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

	def down(pint)
		@intoxication << pint
	end

	def intoxication_level
		intoxication.count
	end

	def glass(patron)
		patron.wounds += 1
	end

	def hospitalized?
		wounds >= 3
	end

end