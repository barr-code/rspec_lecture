class Pint

attr_accessor :name

def initialize(name = "carling")
	@name = name
	end

def broken?
	@broken = false
end

def full?
	@full = true
end
	
def self.stella
	new("stella")
end

def self.kronenberg
	new("kronenberg")
  end

end