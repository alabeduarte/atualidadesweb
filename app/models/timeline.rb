require 'news_updater'
class Timeline

  def load(repository, reader)
    NewsUpdater.new(repository, reader).update
  end

end
