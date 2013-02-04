class Timeline

  def initialize(repository, news_updater)
    @repository = repository
    @news_updater = news_updater
  end

  def featured_news
    Thread.new { @news_updater.update_by @repository.all }
    @featured_news ||= Cache.fetch(key: 'breaking_news') { News.breaking_news }
  end

end
