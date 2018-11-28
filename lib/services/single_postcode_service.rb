require 'httparty'
require 'json'

class SinglePostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_status_code
    @single_postcode_data['status']
  end

  def get_results
    @single_postcode_data['result']
  end

  def search_single_result_for(search_word)
    @single_postcode_data['result']["#{search_word}"]
  end

end
