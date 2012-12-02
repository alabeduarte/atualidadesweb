require 'nokogiri'
require 'open-uri'
class NewsCrawler

  attr_reader :title, :selector, :url

  def initialize(feed, selector=Nokogiri::HTML(open(feed.url)))
    @feed = feed
    @selector = selector
    @title = @selector.at_css("title").text
  end

  def news
    news = []
    limit = @feed.limit
    @selector.css(@feed.selector).first(limit).each {|item| news << build_news_by(item)}
    news
  end

private
  def build_news_by(item)
    if (item)
      level = @feed.featured_level

      page_crawler = PageCrawler.new(@feed.host, item)
      title = page_crawler.text(@feed.title)
      subtitle = page_crawler.text(@feed.subtitle)
      img = page_crawler.image(@feed.image_source)
      href = page_crawler.link(@feed.url_pattern)

      # creating news
      News.new(feed: @feed, url: href, title: title, subtitle: subtitle, image: img, featured_level: level)
    end
  end

end
