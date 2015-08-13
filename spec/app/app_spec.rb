describe HealthBoardApp do

  it "should respond to GET" do
    # Stubs
    allow(Person.instance).to receive(:steps).and_return(42)
    # Test
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/Today's steps: 42/)
  end

end