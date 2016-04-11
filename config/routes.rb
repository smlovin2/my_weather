MyWeather::Application.routes.draw do
  get "weathers/show"
  root 'static_pages#index'
end
