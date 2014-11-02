require 'pint'

describe Pint do

let(:pint){Pint.new("stella")}
let(:punter){double :punter}

	it "should not be broken" do
		expect(pint).not_to be_broken
	end

	it "should not be empty" do
		expect(pint).not_to be_empty
	end


	it "should have a name" do
		lager = Pint.new("stella")
		expect(lager.name).to eq ("stella")
	end

	it "should be a stella pint" do
		stella = Pint.stella
		expect(stella.name).to eq ("stella")
	end

	it "should be a Kronenberg" do
		kronenberg = Pint.kronenberg
		expect(kronenberg.name).to eq ("kronenberg")
	end
end