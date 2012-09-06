class Timeline

  def initialize(repository)
    @feeds ||= repository.all
  end

  def all(reader)
    news = []
    @feeds.each {|f| news.concat fetch(f, reader) }
    return news
  end

private
  def fetch(feed, reader)
    url = feed.url
    feed.fetch reader.new(url)
  end

end
