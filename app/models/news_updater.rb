require 'cache'
class NewsUpdater

  def initialize(reader)
    @reader = reader
  end

  def update_by(key, feeds)
    return Cache.fetch(key: key) {
      news = []
      workers = []
      feeds.each do |f|
        workers << Thread.new { news.concat fetch_news(f) }
      end
      workers.each(&:join)
      return news.shuffle
    }
  end

private
  def fetch_news(feed)
    url = feed.url
    feed.fetch @reader.new(url)
  end
end
