class News
  include MongoMapper::Document

  belongs_to :feed

  key :url, String
  key :title, String
  key :subtitle, String
  key :image, String
  key :featured_level, Integer

  def self.breaking_news
    self.all(limit: 50, order: :id.desc)
  end

end
