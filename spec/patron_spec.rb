require 'patron'

describe Patron do
	let(:patron) {Patron.new}
	let(:pint) {double :pint}
	let(:pub) {double :pub}

	it "is not drunk to start with" do
		expect(patron.drunk?).to eq false
	end

	it "has an intoxication level" do
		expect(patron.intoxication).to eq []
	end

	it "can drink a pint" do
		patron.down(pint)
		expect(patron.intoxication_level).to eq 1
	end

	it "can be drunk" do
		expect(patron).to respond_to :drunk?
	end

	it "gets drunk" do
		10.times {patron.down(pint)}
		expect(patron).to be_drunk
	end

	it "gets paralytic" do
		15.times {patron.down(pint)}
		expect(patron).to be_paralytic
	end

	xit "can enter a pub" do
		expect{patron.enter(pub)}.to change{pub.patron_count}.by 1
	end

	xit "can leave a pub" do
		expect{patron.leave(pub)}.to change{pub.patron_count}.by -1
	end

	it "moving from one pub to another leaves first pub" do
		pub1 = double :pub
		pub2 = double :pub
		allow(pub2).to receive(:admit)
		expect(pub1).to receive(:expel)
		patron.move(pub1, pub2)
	end

	it "moving from one pub to another enters second pub" do
		pub1 = double :pub
		pub2 = double :pub
		allow(pub1).to receive(:expel)
		expect(pub2).to receive(:admit)
		patron.move(pub1, pub2)
	end

	it "can glass another patron" do
		hadi, sean = Patron.new, Patron.new
		hadi.glass(sean)
		expect(sean.wounds).to eq 1
	end

	it "can be hospitalized" do
		sandrine, victoria = Patron.new, Patron.new
		3.times {sandrine.glass(victoria)}
		expect(victoria).to be_hospitalized
	end

end