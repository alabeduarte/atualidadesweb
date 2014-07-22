require 'cache'
require 'news_crawler'

class NewsUpdater
  def update_by(feeds)
    Cache.fetch(key: 'featured') do
      Thread.new { News.destroy_old_news }
      feeds.each do |feed|
        Thread.new { NewsCrawler.new(feed).fetch }
      end
    end
  end
end
