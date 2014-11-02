class Pub

	attr_reader :capacity, :storage_limit

	def initialize
		@pints = []
		@patrons = []
		@capacity = 100
		@storage_limit = 500
	end

	def pint_count
		@pints.count
	end

	def patron_count
		@patrons.count
	end

	def stock(pint)
		@pints << pint unless pint_count == storage_limit
	end

	def admit(patron)
		@patrons << patron unless patron.drunk? || patron_count == capacity
	end

	def expel(patron)
		@patrons.delete(patron)
	end
end