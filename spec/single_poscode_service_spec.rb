describe SinglePostcodeService do

  before(:all) do
    @single_postcode_service = Postcodeio.new.single_postcode_service
    @single_postcode_service.get_single_postcode('B601JA')
  end

  it "should respond with a status message of 200" do
    expect(@single_postcode_service.get_status_code).to eq 200
  end

end
