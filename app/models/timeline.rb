class Timeline

  def initialize(repository, news_updater=NewsUpdater.new)
    @repository = repository
    @news_updater = news_updater
  end

  def featured_news
    @featured_news ||= @news_updater.update_by('featured', featured_feeds)
  end

private
  def featured_feeds
    @featured_feeds ||= @repository.all(featured_level: 0)
  end
end
