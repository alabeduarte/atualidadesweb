class Timeline

  def initialize(repository, news_updater)
    @repository = repository
    @news_updater = news_updater
  end

  def featured_news
    @featured_news ||= @news_updater.update_by('featured', all_feeds)
  end

private
  def all_feeds
    @all_feeds ||= @repository.all(featured_level: 0)
  end
end
