require 'rails_helper'

RSpec.describe "weathers/show.html.erb", type: :view do
  
  before do
    assign(:response, {"coord"=>{"lon"=>-122.09,"lat"=>37.39},
                "weather"=>[{"id"=>800,"main"=>"Clear","description"=>"Sky is Clear","icon"=>"01n"}],
                "base"=>"stations",
                "main"=>{"temp"=>54.55,"humidity"=>74,"pressure"=>1016.8,"temp_min"=>53.00,"temp_max"=>55.99},
                "wind"=>{"speed"=>2.15,"deg"=>285.001},
                "clouds"=>{"all"=>0},
                "dt"=>1427700245,
                "id"=>0,
                "name"=>"Mountain View",
                "cod"=>200})
  end
  
  it 'shows the location name' do
    render
    
    expect(rendered).to have_tag('#location')
  end
  
  it 'shows current conditions' do
    render 
    
    expect(rendered).to have_tag('#conditions')
    
  end
  
  it 'shows the temperature' do
    render
    
    expect(rendered).to have_tag('#temperature')
  end
  
  it 'shows wind speed and direction' do
    render
    
    expect(rendered).to have_tag('#wind')
  end
end
