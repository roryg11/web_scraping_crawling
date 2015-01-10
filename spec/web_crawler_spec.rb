require 'spec_helper'
require 'web_crawler'
require 'rest-client'
require 'nokogiri'

describe Restaurant do

  it "returns and array of suggested restaurants" do
    suggested_restaurants = Restaurant.new('http://www.yelp.com/biz/fat-angel-san-francisco')
    restaurant_array = suggested_restaurants.rest_array

    expect(restaurant_array.class).to eq(Array)
  end

  it "returns the url of the suggested restaurants" do
    suggested_restaurants = Restaurant.new('http://www.yelp.com/biz/fat-angel-san-francisco')

    expect(suggested_restaurants.find_rest_url.class).to eq(Array)
  end

  it "checks the webpages healthscore" do
    restaurant = Restaurant.new('http://www.yelp.com/biz/fat-angel-san-francisco')

    expect(restaurant.healthscore).to eq("98")
  end

  it "returns the name of the restaurant" do
    restaurant = Restaurant.new('http://www.yelp.com/biz/fat-angel-san-francisco')

    expect(restaurant.rest_name).to eq("Fat Angel")
  end
end
