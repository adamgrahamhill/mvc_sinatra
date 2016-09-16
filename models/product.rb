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

end