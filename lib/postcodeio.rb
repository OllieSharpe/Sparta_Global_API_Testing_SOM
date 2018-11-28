#inculding the services
require_relative 'services/single_postcode_service'
require_relative 'services/multiple_postcodes_service'
require_relative 'services/postcode_generator_service'

# superclass
class Postcodeio

  def single_postcode_service
    SinglePostcodeService.new
  end

  def multiple_postcodes_service
    MultiplePostcodeService.new
  end

  def postcode_generator_service
    RandomPostcodes.new
  end

end
