require 'HTTParty'
require 'json'

class Product

  # ping the API for the product JSON
  url = 'https://fomotograph-api.udacity.com/products.json'
  DATA = HTTParty.get(url)['photos']
  
end