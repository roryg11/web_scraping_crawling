require 'rest-client'
require 'nokogiri'

class Restaurant
  def initialize(url)
    page_html = RestClient.get "#{url}", :user_agent => 'Chrome'
    @page_object = Nokogiri::HTML(page_html)
  end

  def rest_array
    restaurant_array = []
    @page_object.css(".related-businesses .biz-name").each do |restaurant|
      restaurant_array.push(restaurant)
    end
    restaurant_array
  end

  # return an array of urls
  def find_rest_url
    url_array = []
    restaurant_array = self.rest_array
    restaurant_array.each do |restaurant|
      url_array.push("http://www.yelp.com#{restaurant.attr('href')}")
    end
    url_array
  end

  def healthscore
    @page_object.css("div.score-block").text.strip
  end

  def rest_name
    @page_object.css(".biz-page-title").text.strip
  end
end

class Bfs
  def initialize(url)
    @page = Restaurant.new(url)
  end

  def new_page(url)
    @child_page
  end

  def bfs(value)
    queue = [@page]

    while !queue.empty?
      current_node = queue.pop
      p "#{current_node.rest_name} has a health score of #{current_node.healthscore}"
      return "Gonna eat at #{current_node.rest_name}" if current_node.healthscore.to_i == value.to_i
      # each statement
      rest_url = current_node.find_rest_url
      rest_url.map do |site|
        queue.unshift(Restaurant.new(site))
      end
    end
    return nil
  end
end
