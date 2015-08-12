describe HealthBoardApp, :vcr do

  it "should respond to GET" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/Today's steps: /)
  end

end