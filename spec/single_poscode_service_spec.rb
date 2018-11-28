describe SinglePostcodeService do

  before(:all) do
    @single_postcode_service = Postcodeio.new.single_postcode_service
    @single_postcode_service.get_single_postcode('B601JA')
  end

  it "should respond with a status message of 200" do
    expect(@single_postcode_service.get_status_code).to eq 200
  end

  it "should have a results hash" do
    expect(@single_postcode_service.get_results).to be_kind_of(Hash)
  end

  it "should return a postcode between 5-7 in length"  do
    expect(@single_postcode_service.search_single_result_for('postcode').delete(' ').length).to be_between(5,7).inclusive
  end

  it "should return an quality key integer between 1-9" do
    expect(@single_postcode_service.search_single_result_for('quality')).to be_between(1, 9).inclusive
  end

  it "should return an ordnance survey eastings value as integer" do
    expect(@single_postcode_service.search_single_result_for('eastings')).to be_kind_of(Integer)
  end

  it "should return an ordnance survey northings value as integer" do
    expect(@single_postcode_service.search_single_result_for('northings')).to be_kind_of(Integer)
  end

  it "should return a country which is one of the four constituent countries of the UK" do
    expect(@single_postcode_service.search_single_result_for('country').downcase).to eq("england").or eq("northern ireland").or eq("scotland").or eq("wales")
  end

  it "should return a string value for NHS authority " do
    expect(@single_postcode_service.search_single_result_for('nhs_ha')).to be_kind_of(String)
  end

  it "should return a longitude float value" do
    expect(@single_postcode_service.search_single_result_for('longitude')).to be_kind_of(Float)
  end

  it "should return a latitude float value" do
    expect(@single_postcode_service.search_single_result_for('latitude')).to be_kind_of(Float)
  end

  it "should return a parliamentary constituency string" do
    expect(@single_postcode_service.search_single_result_for('parliamentary_constituency')).to be_kind_of(String)
  end

  it "should return a european_electoral_region string" do
    expect(@single_postcode_service.search_single_result_for('european_electoral_region')).to be_kind_of(String)
  end

  it "should return a primary_care_trust string" do
    expect(@single_postcode_service.search_single_result_for('primary_care_trust')).to be_kind_of(String)
  end

  it "should return a region string" do
    expect(@single_postcode_service.search_single_result_for('region')).to be_kind_of(String).or be_nil
  end

  it "should return a parish string" do
    expect(@single_postcode_service.search_single_result_for('parish')).to be_kind_of(String).or be_nil
  end

  it "should return a lsoa string" do
    expect(@single_postcode_service.search_single_result_for('lsoa')).to be_kind_of(String)
  end

  it "should return a msoa string" do
    expect(@single_postcode_service.search_single_result_for('msoa')).to be_kind_of(String).or be_nil
  end
  # admin ward and county are not documented however tested below

  it "should return an admin_district string" do
    expect(@single_postcode_service.search_single_result_for('admin_district')).to be_kind_of(String)
  end

  it "should return a incode string of three characters" do
    expect(@single_postcode_service.search_single_result_for('incode').length).to eq 3
  end

  it "should return an outcode string of 3-4 characters" do
    expect(@single_postcode_service.search_single_result_for('outcode').length).to be_between(2, 4)
  end

end
