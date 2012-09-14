require 'cache'
require 'news_updater'
require 'news'

class Timeline

  def load(repository, reader)
    Cache.fetch(key: 'timeline.all') { NewsUpdater.new(repository, reader)
.update }
  end

end
