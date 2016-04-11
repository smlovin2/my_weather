require 'rails_helper'

RSpec.describe WeathersController, type: :controller do
  
  before do
    response = '{"coord":{"lon":-122.09,"lat":37.39},
                "sys":{"type":3,"id":168940,"message":0.0297,"country":"US","sunrise":1427723751,"sunset":1427768967},
                "weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],
                "base":"stations",
                "main":{"temp":285.68,"humidity":74,"pressure":1016.8,"temp_min":284.82,"temp_max":286.48},
                "wind":{"speed":0.96,"deg":285.001},
                "clouds":{"all":0},
                "dt":1427700245,
                "id":0,
                "name":"Mountain View",
                "cod":200}'
    stub_request(:any, /api.openweathermap.org/).to_return(body: response, status: 200, headers: {})
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, zipcode: 94040
      expect(response).to have_http_status(:success)
    end
    
    it "gets sets 'response' to be the response from the api call" do
      get :show, zipcode: 94040
      expect(assigns(:response)).to_not eq(nil)
    end
  end

end
