describe Vote do 
	describe "validations" do
		describe "value validation" do
			it "only allows -1 or 1 as values" do
				v_postive = Vote.new(value: 1)
				expect (v_postive.valid?).to eq(true)

				v_negative = Vote.new(value: -1)
				expect (v_negative.valid?).to eq(true)

				v_false = Vote.new(value: 4)
				expect (v_false.valid?).to eq(false)
			end
		end
	end
	

