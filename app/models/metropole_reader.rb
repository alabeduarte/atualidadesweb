class MetropoleReader
  
  def initialize(reader=WebReader.new('http://www.metro1.com.br/portal/?varSession=noticia&varEditoria=cidade'))
    @reader = reader
  end
  
  def highlights
    @reader.highlights( css: '#lista-de-resultados .resultado',
                        url: 'a',
                        date: '.resultado-data',
                        title: '.resultado-titulo',
                        subtitle: '.resultado-texto',
                        image: 'a img.img-resultado',
                        host: 'http://www.metro1.com.br'
                        )
  end

end
