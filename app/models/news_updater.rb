require 'cache'
class NewsUpdater

  def initialize(reader)
    @reader = reader
  end

  def update_by(key, feeds)
    Cache.fetch(key: key) { fetch_news_by feeds }
  end

private
  def fetch_news_by(feeds)
    news = []
    workers = []
    feeds.each do |f|
      workers << Thread.new { news.concat read_from(f) }
    end
    workers.each(&:join)
    return news.shuffle
  end

  def read_from(feed)
    url = feed.url
    feed.fetch @reader.new(url)
  end
end
