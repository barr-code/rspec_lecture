class Pint

attr_accessor :name, :empty

	def initialize(name = "carling")
		@name = name
		@empty = false
	end

	def broken?
		@broken = false
	end

	def empty?
		@empty = false
	end

	def empty!
		@empty = true
	end
		
	def self.stella
		new("stella")
	end

	def self.kronenberg
		new("kronenberg")
	end

end