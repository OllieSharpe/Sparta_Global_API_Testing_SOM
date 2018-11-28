describe MultiplePostcodeService do

  before(:all) do
    @postcodes_array = ['B601JA', 'SW155FB']
    @multiple_postcodes_service = Postcodeio.new.multiple_postcodes_service
    @multiple_postcodes_service.get_multiple_postcodes(@postcodes_array)
  end

  it "should respond with a status message of 200" do
    expect(@multiple_postcodes_service.get_status_code).to eq 200
  end

  it "should have a results hash" do
    expect(@multiple_postcodes_service.get_results(0)).to be_kind_of(Hash)
    expect(@multiple_postcodes_service.get_results(1)).to be_kind_of(Hash)
  end

end
