class NewsFeed
  include MongoMapper::Document

  key :host, String
  key :selector, String
  key :url_pattern, String
  key :title, String
  key :subtitle, String
  key :image_source, String
  key :date_tag, String

  validates :selector, :url_pattern, :title, :subtitle, :presence => true
  validates :host, :format => URI::regexp(%w(http https)), :presence => true

end