class News
  attr_reader :url, :date, :title, :subtitle, :image, :featured_level

  def initialize(args)
    @url = args[:url]
    @keywords = args[:keywords]
    @date = args[:date]
    @title = args[:title]
    @subtitle = args[:subtitle]
    @image = args[:image]
    @featured_level = args[:featured_level]
  end
end
