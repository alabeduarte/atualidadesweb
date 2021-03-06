def should_seed? model
  empty = model.all.empty?
  puts (empty ? "Seeding #{model}": "Not seeding #{model}. Already populated.")
  empty
end

if should_seed? Feed
  Feed.create(
            favicon: "http://veja.abril.com.br/favicon.ico",
            selector: ".editorial ul li",
            featured_level: 0,
            limit: 10,
            url: "http://veja.abril.com.br/",
            host: "http://veja.abril.com.br/",
            url_pattern: "a",
            title: ".chapeu",
            subtitle: ".chamada-titulo",
            image_source: "img")
  Feed.create(
            selector: "#destaqueReportagemScroll .destaqueReportagemMateria",
            featured_level: 0,
            limit: 10,
            url: "http://www.istoe.com.br",
            host: "http://www.istoe.com.br",
            url_pattern: "a",
            title: "span",
            subtitle: "a",
            image_source: "img")

  Feed.create(
            favicon: "http://revistaepoca.globo.com/media/main/img/favicon.ico",
            selector: ".widgets-ultimas-por-editoria .chamada-comfoto, .widgets-ultimas-por-editoria ul li",
            featured_level: 0,
            limit: 10,
            url: "http://revistaepoca.globo.com",
            host: "http://revistaepoca.globo.com",
            url_pattern: "a",
            title: "a",
            image_source: "img")

  Feed.create(
              url: 'http://www.globo.com/',
              favicon: 'http://s.glbimg.com/en/ho/static/globocom/img/favicon.png',
              host: 'http://www.globo.com/',
              selector: '.glb-area-colunas .area .chamada-principal',
              url_pattern: 'a',
              title: '.conteudo p',
              image_source: 'img',
              featured_level: 0,
              limit: 20)
  Feed.create(
              url: 'http://g1.globo.com',
              favicon: 'http://s.glbimg.com/jo/g1/media/portal/img/logos/favicon.png',
              host: 'http://g1.globo.com',
              selector: '#glb-corpo .glb-primeiro .glb-area .chamada',
              url_pattern: 'a',
              title: '.chapeu',
              subtitle: 'a',
              image_source: '.foto a img',
              featured_level: 0,
              limit: 8)
  Feed.create(
              url: 'http://www.uol.com.br/',
              favicon: 'http://home.img.uol.com.br/favicon.ico',
              host: 'http://www.uol.com.br/',
              selector: '.moduloChamada',
              url_pattern: 'a',
              title: 'a strong',
              subtitle: 'a',
              image_source: 'a img',
              featured_level: 0,
              limit: 3)
  Feed.create(
              url: 'http://g1.globo.com',
              favicon: 'http://s.glbimg.com/jo/g1/media/portal/img/logos/favicon.png',
              host: 'http://g1.globo.com',
              selector: '#glb-corpo .glb-ultimo .glb-area .chamada',
              url_pattern: 'a',
              title: '.chapeu',
              subtitle: 'a',
              image_source: '.foto a img',
              featured_level: 0,
              limit: 5)
  Feed.create(
              url: 'http://g1.globo.com',
              favicon: 'http://s.glbimg.com/jo/g1/media/portal/img/logos/favicon.png',
              host: 'http://g1.globo.com',
              selector: '.lista-noticia-plantao li',
              url_pattern: 'a',
              title: '.chapeu',
              subtitle: '.titulo',
              image_source: 'a.borda-interna img',
              featured_level: 0,
              limit: 6)
  Feed.create(
              url: 'http://noticias.uol.com.br/noticias/',
              favicon: 'http://home.img.uol.com.br/favicon.ico',
              host: 'http://uol.com.br/',
              selector: 'div.geral section article.news',
              url_pattern: 'h1 a',
              title: 'h1 a span',
              subtitle: 'p',
              image_source: 'h1 a img',
              featured_level: 0,
              limit: 10)
  Feed.create(
              url: 'http://www1.folha.uol.com.br/emcimadahora/',
              favicon: 'http://f.i.uol.com.br/favicon.ico',
              host: 'http://www1.folha.uol.com.br/',
              selector: '#newslist .nl2',
              url_pattern: '.nlArticle a',
              title: '.nlSection',
              subtitle: '.nlArticle a',
              featured_level: 0,
              limit: 15)
  Feed.create(
              url: 'http://noticias.terra.com.br/ultimasnoticias/0,,EI188,00.html',
              favicon: 'http://s1.trrsf.com.br/favicon.ico',
              host: 'http://terra.com.br/',
              selector: '.articles li',
              url_pattern: 'a',
              title: 'strong',
              subtitle: '',
              image_source: '',
              featured_level: 0,
              limit: 15)
  Feed.create(
              url: 'http://www.bbc.co.uk/portuguese/',
              favicon: 'http://www.bbc.co.uk/favicon.ico',
              host: 'http://www.bbc.co.uk/',
              selector: '.link.title',
              url_pattern: 'a',
              title: 'a',
              image_source: 'img',
              featured_level: 0,
              limit: 15)

end
