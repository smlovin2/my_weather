require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WeathersHelper. For example:
#
# describe WeathersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe WeathersHelper, type: :helper do
  before do
    @response = {"coord"=>{"lon"=>-122.09,"lat"=>37.39},
                "weather"=>[{"id"=>800,"main"=>"Clear","description"=>"Sky is Clear","icon"=>"01n"}],
                "base"=>"stations",
                "main"=>{"temp"=>54.55,"humidity"=>74,"pressure"=>1016.8,"temp_min"=>53.00,"temp_max"=>55.99},
                "wind"=>{"speed"=>2.15,"deg"=>285.001},
                "clouds"=>{"all"=>0},
                "dt"=>1427700245,
                "id"=>0,
                "name"=>"Mountain View",
                "cod"=>200}
  end
  
  describe '#location' do
    it 'returns the name of the location' do
      expect(helper.location(@response)).to eq('Location: Mountain View')
    end
  end
  
  describe '#condition' do
    it 'returns the weather condition' do
      expect(helper.condition(@response)).to eq('Condition: Sky is Clear')
    end
  end
  
  describe 'temperature' do
    it 'returns the temperature' do
      expect(helper.temperature(@response)).to eq('Temperature(F): 54.55')
    end
  end
  
  describe 'wind' do
    it 'returns the wind speed and direction' do
      expect(helper.wind(@response)).to eq('Wind: WNW 2.15mph')
    end
  end
end
