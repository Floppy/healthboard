describe Person, :vcr do

  before :all do
    @person = Person.instance
  end
  
  it "should get a latest step count" do
    Timecop.freeze(2015,8,12) do
      @person.steps.should == 471
    end
  end
  
end