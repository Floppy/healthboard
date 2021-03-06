describe Person, :vcr do

  before :all do
    @person = Person.instance
  end
  
  it "should get a latest step count" do
    Timecop.freeze(2015,8,12) do
      expect(@person.steps).to be(471)
    end
  end
  
  it "should get a latest weight in kg" do
    Timecop.freeze(2015,8,13) do
      expect(@person.weight.value).to be_within(0.1).of(121)
      expect(@person.weight.unit.name).to eq("kilogram")
    end
  end

  it "should get a latest BMI" do
    Timecop.freeze(2015,8,13) do
      expect(@person.bmi).to be(35.35)
    end
  end

end