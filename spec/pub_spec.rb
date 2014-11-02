require 'pub'

describe Pub do

	let(:pub) {Pub.new}
	let(:pint) {double :pint}
	let(:patron) {double :patron, :drunk? => false}


	it "initializes without pints" do
		expect(pub.pint_count).to eq 0
	end

	it "has limited pint storage" do
		expect(pub.storage_limit).to eq 500
	end

	it "can stock pints" do
		20.times {pub.stock(pint)}
		expect(pub.pint_count).to eq 20
	end

	it "can't stock more pints than storage allows" do
		500.times {pub.stock(pint)}
		expect{pub.stock(pint)}.to change{pub.pint_count}.by 0
	end

	it "initialized without any patrons" do
		expect(pub.patron_count).to eq 0
	end

	it "has a limited patron capacity" do
		expect(pub.capacity).to eq 100
	end

	it "can admit patrons" do
		10.times {pub.admit(patron)}
		expect(pub.patron_count).to eq 10
	end

	it "turns away drunk patrons" do
		drunk_patron = double :patron, :drunk? => true
		expect{pub.admit(drunk_patron)}.to change{pub.patron_count}.by 0
	end

	it "can expel patrons" do
		pub.admit(patron)
		expect{pub.expel(patron)}.to change{pub.patron_count}.by -1
	end

	it "does not admit more patrons than it has capacity for" do
		100.times {pub.admit(patron)}
		expect{pub.admit(patron)}.to change{pub.patron_count}.by 0
	end
end
