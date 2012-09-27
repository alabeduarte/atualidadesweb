require 'news_updater'
class Timeline

  def initialize(repository, reader, news_updater=NewsUpdater.new(reader))
    @repository = repository
    @reader = reader
    @news_updater = news_updater
  end

  def featured_news
    @featured_news ||= @news_updater.update_by('featured', featured_feeds)
  end

  def plain_news
    @plain_news ||= @news_updater.update_by('plain', plain_feeds)
  end

  private
  def featured_feeds
    @featured_feeds ||= @repository.all(featured_level: 0)
  end

  def plain_feeds
    @plain_feeds ||= @repository.all(featured_level: 1)
  end
end
