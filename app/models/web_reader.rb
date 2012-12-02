require 'nokogiri'
require 'open-uri'
class WebReader

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
      title = find_text(item, @feed.title)
      subtitle = find_text(item, @feed.subtitle)
      img = find_image(item, @feed.image_source)
      href = find_link(item, @feed.url_pattern, 'href')

      if @feed.host
        href = "#{@feed.host}/#{href}".gsub('../', '') if href && !href.include?('http')
        img = "#{@feed.host}/#{img}".gsub('../', '') if img && img.include?('../')
      end

      # creating news
      News.new(feed: @feed, url: href, title: title, subtitle: subtitle, image: img, featured_level: level)
    end
  end

  def find_image(item, image_source)
    image = find_link(item, image_source, 'src')
    if (image && image.include?("==/"))
      image = "http://#{image.split("==/").last}"
    end
    image
  end

  def find_link(item, element, src)
    item.css(element).map { |doc| doc[src] }.first if valid?(element)
  end

  def find_text(item, element)
    item.css(element).text if valid?(element)
  end

  def valid?(element)
    element && !element.empty?
  end

end
