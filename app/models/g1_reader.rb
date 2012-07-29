class G1Reader
  
  def initialize(reader=WebReader.new('http://g1.globo.com'))
    @reader = reader
  end
  
  def highlights
    @reader.highlights( css: '#glb-corpo .glb-area .chamada-principal',
                        url: 'a',
                        title: '.chapeu',
                        subtitle: '.subtitulo',
                        image: '.foto a img'
                        )
  end

end
