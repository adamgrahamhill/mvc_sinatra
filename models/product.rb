require 'HTTParty'
require 'json'

class Product

  # ping the API for the product JSON
  url = 'https://fomotograph-api.udacity.com/products.json'
  DATA = HTTParty.get(url)['photos']

  # initialize a Product object using a data hash
  def initialize(product_data = {})
    @id = product_data['id']
    @title = product_data['title']
    @location = product_data['location']
    @summary = product_data['summary']
    @url = product_data['url']
    @price = product_data['price']
  end

  # return an array of Product objects
  def self.all
    DATA.map { |product| new(product) }
  end

end