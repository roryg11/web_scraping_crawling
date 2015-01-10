require 'open-uri'
require 'nokogiri'

class YelpReview
  attr_reader :raw

  def initialize(raw)
    @raw = raw
  end

  def date_of_review
    @raw.css('span meta')[0]['content']
  end

  def stars
    @raw.css('div.rating-very-large').css('meta').attr("content").value
  end

  def user_name
    @raw.css('li.user-name a')[0].text
  end

  def content
    @raw.css('div.review-content p')[0].text
  end
end
