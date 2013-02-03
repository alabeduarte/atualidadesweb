class News
  include MongoMapper::Document

  belongs_to :feed

  key :url, String
  key :title, String
  key :subtitle, String
  key :image, String
  key :featured_level, Integer

  def self.breaking_news
    @breaking_news ||= self.all(limit: 130, order: :id.desc)
    @breaking_news.shuffle
  end

end
