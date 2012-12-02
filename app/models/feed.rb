class Feed
  include MongoMapper::Document

  key :url, String
  key :selector, String
  key :url_pattern, String
  key :title, String
  key :subtitle, String
  key :image_source, String
  key :favicon, String
  key :host, String
  key :featured_level, Integer
  key :limit, Integer

  validates :selector, :url_pattern, :presence => true
  validates :url, :host, :format => URI::regexp(%w(http https)), :presence => true
  validates :featured_level, :limit, :numericality => true, :presence => true

  def news(reader=WebReader.new(self))
    reader.news
  end

end
