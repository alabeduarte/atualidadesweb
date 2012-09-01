class Timeline

  def initialize(repository=NewsFeed)
    @news = []
    @feeds ||= repository.all
    @feeds.each {|f| @news.concat(f.fetch) }
  end

  def list
    @news
  end

end
