require 'HTTParty'
require 'json'

class Product

  attr_reader :id, :title, :location, :summary, :url, :price

  LOCATIONS = ['canada', 'england', 'france', 'ireland', 'mexico', 'scotland', 'taiwan', 'us']

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

  def self.sample_locations
  	@products = []
  	LOCATIONS.each do |location|
  		@products.push self.all.select { |product| product.location == location }.sample
  	end
  	return @products
  end

  # Create the class method find_by_location that accepts a location string as an
  # argument and returns an array of Products that have the given location.

  def self.find_by_location(selected_location)
  	self.all.select { |product| product.location == selected_location }
  end

  def self.find(product_id)
  	self.all.select { |product| product.id == product_id.to_i }.first
  end

  def self.priced_below(price)
  	self.all.select { |product| product.price < price }
  end
  
end