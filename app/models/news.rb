class News
  include MongoMapper::Document

  belongs_to :feed

  key :url, String
  key :title, String
  key :subtitle, String
  key :image, String
  key :featured_level, Integer

end
