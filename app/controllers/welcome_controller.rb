class WelcomeController < ApplicationController
  def index
  end
  
  def g1_news
    reader=Newly.new('http://g1.globo.com')
    @news = reader.highlights( selector: '#glb-corpo .glb-area .chamada-principal',
                        url: 'a',
                        title: '.chapeu',
                        subtitle: 'a',
                        img: '.foto a img'
                        )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
  def g1_bahia_news
    reader=Newly.new('http://g1.globo.com/bahia/')
    @news = reader.highlights( selector: '#ultimas-regiao div, #ultimas-regiao ul li',
                               href: 'a',
                               date: '.data-hora',
                               title: '.titulo',
                               subtitle: '.subtitulo',
                               img: 'img'
                              )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
  def atarde_news
    reader=Newly.new('http://atarde.uol.com.br/ultimas-noticias/')
    @news = reader.highlights( selector: '#listagemUltimas ul li .colNot .box_colNot',
                               href: 'a',
                               date: '.hora-comment',
                               title: '.hoverNot',
                               subtitle: '.resumoNoticia',
                               img: 'img',
                               host: 'http://atarde.uol.com.br'
                              )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
  def metro1_news
    reader=Newly.new('http://www.metro1.com.br/portal/?varSession=noticia&varEditoria=cidade')
    @news = reader.highlights( selector: '#lista-de-resultados .resultado',
                                href: 'a',
                                date: '.resultado-data',
                                title: '.resultado-titulo',
                                subtitle: '.resultado-texto',
                                img: 'a img.img-resultado',
                                host: 'http://www.metro1.com.br'
                                )
    respond_to do |format|
      format.html
      format.json  { render :json => @news.as_json }
    end
  end
  
end
