require 'nokogiri'
require 'open-uri'
class Reader

  attr_reader :title, :selector, :url

  def initialize(url, selector=Nokogiri::HTML(open(url)))
    @url = url
    @selector = selector
    @title = @selector.at_css("title").text
  end

  def highlights(args)
    news = Array.new
    if (args[:limit])
      limit = args[:limit]
      @selector.css(args[:selector]).first(limit).each do |item|
        news << build_news_by(item, args)
      end
    else
      @selector.css(args[:selector]).each do |item|
        news << build_news_by(item, args)
      end
    end
    news
  end

private
  def build_news_by(item, args)
    if (item)
      level = args[:featured_level]
      date = find_element(item, args[:date])
      title = find_element(item, args[:title])
      subtitle = find_element(item, args[:subtitle])
      img = find_image(item, args)
      href = find_link(item, args[:href], 'href')

      host = args[:host]
      if host
        href = "#{host}/#{href}".gsub('../', '') if href && !href.include?('http')
        img = "#{host}/#{img}".gsub('../', '') if img && img.include?('../')
      end

      # creating news
      News.new(url: href, date: date, title: title, subtitle: subtitle, image: img, featured_level: level)
    end
  end

  def find_image(item, options)
    image = find_link(item, options[:img], 'src')
    if (image && image.include?("==/"))
      image = "http://#{image.split("==/").last}"
    end
    image
  end

  def find_link(item, element, src)
    item.css(element).map { |doc| doc[src] }.first if valid?(element)
  end

  def find_element(item, element)
    item.css(element).text if valid?(element)
  end

  def valid?(element)
    element && !element.empty?
  end

end
