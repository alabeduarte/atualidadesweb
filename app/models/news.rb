class News
  include MongoMapper::Document

  LIMIT = 130

  timestamps!
  belongs_to :feed

  key :url, String
  key :title, String
  key :subtitle, String
  key :image, String
  key :featured_level, Integer

  def self.build_with(options)
    where(url: options[:url]).first_or_create(options)
  end

  def self.breaking_news
    @breaking_news ||= self.all(limit: LIMIT, order: :created_at.desc)
    @breaking_news.shuffle
  end

  def self.destroy_old_news
    total_news = News.count
    if total_news > LIMIT
      old_news = self.all(limit: News.count - LIMIT, order: :created_at.asc)
      old_news.each { |o| o.destroy }
    end
  end

end
