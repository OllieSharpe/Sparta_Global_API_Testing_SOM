require 'httparty'
require 'json'

class MultiplePostcodeService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_multiple_postcodes(postcodes_array)
    @multiple_postcodes_data = JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  def get_status_code
    @multiple_postcodes_data['status']
  end

  def get_all_results
    @multiple_postcodes_data['result']
  end

  def get_results(iterator)
    @multiple_postcodes_data['result'][iterator]['result']
  end

  def search_multiple_results_for(search_word)
    results_array = []
    for i in 0..(@multiple_postcodes_data.length - 1)
      results_array << @multiple_postcodes_data['result'][i]['result']["#{search_word}"]
    end
    return results_array
  end

  def get_postcodes_multiple(iterator)
    @multiple_postcodes_data['result'][iterator]['result']['postcode']
  end

end
