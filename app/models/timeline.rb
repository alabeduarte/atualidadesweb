require 'cache'
require 'news'
class Timeline

  def initialize(repository)
    @feeds = repository.all
  end

  def load(reader)
    Cache.fetch(key: 'timeline.all') { all(reader) }
  end

  def all(reader)
    news = []
    workers = []
    @feeds.each do |f|
      workers << Thread.new { news.concat fetch_news(f, reader) }
    end
    workers.each {|w| w.join }
    return news
  end

private
  def fetch_news(feed, reader)
    url = feed.url
    feed.fetch reader.new(url)
  end

end
