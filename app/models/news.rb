class News
  attr_reader :feed, :url, :title, :subtitle, :image, :featured_level

  def initialize(args)
    @feed = args[:feed]
    @url = args[:url]
    @keywords = args[:keywords]
    @title = args[:title]
    @subtitle = args[:subtitle]
    @image = args[:image]
    @featured_level = args[:featured_level]
  end
end
