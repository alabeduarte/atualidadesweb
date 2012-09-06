class Timeline

  def initialize(repository)
    @feeds ||= repository.all
  end

  def all(reader)
    news = []
    @feeds.each {|f| news.concat fetch_news(f, reader) }
    return news
  end

private
  def fetch_news(feed, reader)
    url = feed.url
    feed.fetch reader.new(url)
  end

end
