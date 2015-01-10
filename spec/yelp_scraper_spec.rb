require 'spec_helper'
require 'yelp_scraper'

describe YelpReview do
  let(:file) { File.open("data/fat_angel_source.html", "r") }
  let(:fat_angel) { Nokogiri::HTML(file.read) }

  it "gives the date of review" do
    reviews = fat_angel.css("ul.reviews").css("li")
    review_1 = YelpReview.new(reviews[0])

    expect(review_1.date_of_review).to eq("2014-12-27")
  end

  it "tells you how many stars" do
    reviews = fat_angel.css("ul.reviews").css("li")
    review_1 = YelpReview.new(reviews[0])

    expect(review_1.stars).to eq("5.0")
  end

  it "returns the username for the review" do
    reviews = fat_angel.css("ul.reviews").css("li")
    review_1 = YelpReview.new(reviews[0])

    expect(review_1.user_name).to eq("Stephanie F.")
  end

  it "returns the review content" do
    reviews = fat_angel.css("ul.reviews").css("li")
    review_1 = YelpReview.new(reviews[0])

    expected = "Beer/wine selection: outstanding Customer service: 1 million gold star points to infinity (so so so good for real)Olives: Yes pleaseRomantic: Hell yesCozy: Handled Chocolate cake: PerfectHot Tea: In it's own press ftw I came off my Yelp cleanse to give this place five stars. Tucked away gem. No more details for you! Just go!"

    expect(review_1.content).to eq(expected)
  end
end
