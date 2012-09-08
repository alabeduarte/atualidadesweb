class Feed
  include MongoMapper::Document

  key :url, String
  key :selector, String
  key :url_pattern, String
  key :title, String
  key :subtitle, String
  key :image_source, String
  key :date_tag, String
  key :host, String
  key :featured_level, Integer

  validates :selector, :url_pattern, :title, :presence => true
  validates :url, :host, :format => URI::regexp(%w(http https)), :presence => true

  def fetch(reader)
    reader.highlights(
                      selector: @selector,
                      href: @url_pattern,
                      title: @title,
                      subtitle: @subtitle,
                      img: @image_source,
                      date: @date_tag,
                      host: @host,
                      featured_level: @featured_level
                      )
  end

end
