class News
  attr_reader :url, :title, :subtitle, :image, :featured_level

  def initialize(args)
    @url = args[:url]
    @keywords = args[:keywords]
    @title = args[:title]
    @subtitle = args[:subtitle]
    @image = args[:image]
    @featured_level = args[:featured_level]
  end
end
