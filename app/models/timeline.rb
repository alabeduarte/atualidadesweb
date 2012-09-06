class Timeline

  def initialize(repository, reader)
    @news = Hash.new
    @feeds ||= repository.all
    @feeds.each {|f| @news[f.url] = f.fetch(reader.new(f.url)) }
  end

  def all
    list = []
    @news.keys.each {|k| list.concat self.get(k) }
    return list
  end

  def get(url)
    @news.has_key?(url)? @news[url]: []
  end

end
