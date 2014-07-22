require 'yaml'

class FeedRepository
  def initialize(path)
    @feeds = YAML.load_file path
  end

  def all
    @feeds
  end
end