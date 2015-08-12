describe Person do

  before :all do
    @person = Person.instance
  end
  
  it "should get a latest step count" do
    @person.steps.should == 471
  end
  
end