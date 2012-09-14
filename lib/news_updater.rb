require 'cache'
class NewsUpdater

  def initialize(repository, reader)
    @feeds = repository.all
    @reader = reader
  end

  def update
    return Cache.fetch(key: 'timeline.all') {
      news = []
      workers = []
      @feeds.each do |f|
        workers << Thread.new { news.concat fetch_news(f) }
      end
      workers.each(&:join)
      return news
    }
  end

private
  def fetch_news(feed)
    url = feed.url
    feed.fetch @reader.new(url)
  end
end
