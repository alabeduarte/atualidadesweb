require 'newly'
require 'cache'

class NewsUpdater
  def update_by(feeds)
    Cache.fetch(key: 'featured') do
      Thread.new { News.destroy_old_news }
      feeds.each do |feed|
        Thread.new { Newlt::NewsCrawler.new(url: feed['url'], feed: feed).fetch }
      end
    end
  end
end
