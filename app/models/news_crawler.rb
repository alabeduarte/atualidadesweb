require 'nokogiri'
require 'open-uri'
class NewsCrawler

  attr_reader :title, :selector, :url

  def initialize(feed, selector=Nokogiri::HTML(open(feed.url)))
    @feed = feed
    @selector = selector
    @title = @selector.at_css("title").text
  end

  def fetch
    news_fetched = Set.new
    limit = @feed.limit
    @selector.css(@feed.selector).first(limit).each do |item|
      news_fetched << build_news_by(item)
    end

    news_fetched.to_a
  end

private
  def build_news_by(item)
    if (item)
      page_crawler = PageCrawler.new(@feed.host, item)
      options = {
        feed_id: @feed.id,
        url: page_crawler.link(@feed.url_pattern),
        featured_level: @feed.featured_level,
        title: page_crawler.titleize(@feed.title),
        subtitle: page_crawler.titleize(@feed.subtitle),
        image: page_crawler.image(@feed.image_source)
      }

      News.build_with options
    end
  end

end
