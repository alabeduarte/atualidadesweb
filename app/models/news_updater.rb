require 'cache'
class NewsUpdater

  def initialize(sortable=false)
    @sortable = sortable
  end

  def update_by(key, feeds)
    Cache.fetch(key: key) { fetch_news_by feeds }
  end

protected
  def fetch_news_by(feeds)
    news = []
    workers = []
    feeds.each do |feed|
      workers << Thread.new { news.concat NewsCrawler.new(feed).news }
    end
    workers.each(&:join)
    news = news.shuffle if !@sortable
    news
  end

end
