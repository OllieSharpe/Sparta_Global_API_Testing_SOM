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

  it "should return a postcode between 5-7 in length"  do
    @multiple_postcodes_service.search_multiple_results_for('postcode').each do |item|
      expect(item.delete(' ').length).to be_between(5, 7).inclusive
    end
  end

  it "should return a quality key integer between 1-9" do
    @multiple_postcodes_service.search_multiple_results_for('quality').each do |item|
      expect(item).to be_between(1, 9).inclusive
    end
  end

  it "should return an ordnance survey eastings value as integer" do
    @multiple_postcodes_service.search_multiple_results_for('eastings').each do |item|
      expect(item).to be_kind_of(Integer)
    end
  end

  it "should return an ordnance survey northings value as integer" do
    @multiple_postcodes_service.search_multiple_results_for('northings').each do |item|
      expect(item).to be_kind_of(Integer)
    end
  end

  it "should return a country which is one of the four constituent countries of the UK" do
    @multiple_postcodes_service.search_multiple_results_for('country').each do |item|
      expect(item.downcase).to eq("england").or eq("northern ireland").or eq("scotland").or eq("wales").or eq("channel islands")
    end
  end

  it "should return a string value for NHS authority " do
    @multiple_postcodes_service.search_multiple_results_for('nhs_ha').each do |item|
      expect(item).to be_kind_of(String)
    end
  end

  it "should return a longitude float value" do
    @multiple_postcodes_service.search_multiple_results_for('longitude').each do |item|
      expect(item).to be_kind_of(Float)
    end
  end

  it "should return a latitude float value" do
    @multiple_postcodes_service.search_multiple_results_for('latitude').each do |item|
      expect(item).to be_kind_of(Float)
    end
  end

  it "should return a parliamentary constituency string" do
    @multiple_postcodes_service.search_multiple_results_for('parliamentary_constituency').each do |item|
      expect(item).to be_kind_of(String)
    end
  end

  it "should return a european_electoral_region string" do
    @multiple_postcodes_service.search_multiple_results_for('european_electoral_region').each do |item|
      expect(item).to be_kind_of(String)
    end
  end

  it "should return a primary_care_trust string" do
    @multiple_postcodes_service.search_multiple_results_for('primary_care_trust').each do |item|
      expect(item).to be_kind_of(String)
    end
  end

  it "should return a region string" do
    @multiple_postcodes_service.search_multiple_results_for('region').each do |item|
      expect(item).to be_kind_of(String).or be_nil
    end
  end

  it "should return a parish string" do
    @multiple_postcodes_service.search_multiple_results_for('parish').each do |item|
      expect(item).to be_kind_of(String).or be_nil
    end
  end

  it "should return a lsoa string" do
    @multiple_postcodes_service.search_multiple_results_for('lsoa').each do |item|
      expect(item).to be_kind_of(String)
    end
  end

  it "should return a msoa string" do
    @multiple_postcodes_service.search_multiple_results_for('msoa').each do |item|
      expect(item).to be_kind_of(String).or be_nil
    end
  end
  # admin ward and county are not documented however tested below

  it "should return an admin_district string" do
    @multiple_postcodes_service.search_multiple_results_for('admin_district').each do |item|
      expect(item).to be_kind_of(String)
    end
  end

  it "should return a incode string of three characters" do
    @multiple_postcodes_service.search_multiple_results_for('incode').each do |item|
      expect(item.length).to eq 3
    end
  end

  it "should return an outcode string of 3-4 characters" do
    @multiple_postcodes_service.search_multiple_results_for('outcode').each do |item|
      expect(item.length).to be_between(2, 4).inclusive
    end
  end

end
