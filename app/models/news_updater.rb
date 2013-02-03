require 'cache'
require 'news_crawler'
class NewsUpdater
  def update_by(key, feeds)
    Cache.fetch(key: key) do
      feeds.each do |feed|
        Thread.new { NewsCrawler.new(feed).fetch }
      end
    end
  end
end
