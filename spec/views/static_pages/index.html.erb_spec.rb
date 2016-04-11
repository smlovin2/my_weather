require 'rails_helper'

RSpec.describe 'static_pages/index.html.erb', type: :view do
  it 'has text input for entering your zip code' do
    render
    
    expect(rendered).to have_tag('input#zipcode', placeholder: 'Enter Zipcode')
  end
  
  it 'has Submit button' do
    render
    
    expect(rendered).to have_tag('button', type: :submit) 
  end
end