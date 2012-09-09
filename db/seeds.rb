# Feed.create(
#               url: 'http://g1.globo.com',
#               host: 'http://g1.globo.com',
#               selector: '#glb-corpo .glb-area .chamada-principal',
#               url_pattern: 'a',
#               title: '.chapeu',
#               subtitle: 'a',
#               image_source: '.foto a img')
Feed.create(
              url: 'http://g1.globo.com',
              host: 'http://g1.globo.com',
              selector: '#glb-corpo .glb-primeiro .glb-area .destaque',
              url_pattern: 'a',
              title: '.chapeu',
              subtitle: 'a',
              image_source: '.foto a img',
              featured_level: 0,
              limit: 3)
Feed.create(
              url: 'http://g1.globo.com',
              host: 'http://g1.globo.com',
              selector: '#glb-corpo .glb-ultimo .glb-area .destaque',
              url_pattern: 'a',
              title: '.chapeu',
              subtitle: 'a',
              image_source: '.foto a img',
              featured_level: 1,
              limit: 3)
Feed.create(
              url: 'http://g1.globo.com',
              host: 'http://g1.globo.com',
              selector: '.lista-noticia-plantao li',
              url_pattern: 'a',
              title: '.chapeu',
              subtitle: '.titulo',
              date_tag: '.item-noticia-hora',
              image_source: 'a.borda-interna img',
              featured_level: 2,
              limit: 5)
Feed.create(
              url: 'http://www.uol.com.br/',
              host: 'http://www.uol.com.br/',
              selector: '.moduloChamada',
              url_pattern: 'a',
              title: 'a strong',
              subtitle: 'a',
              image_source: 'a img',
              featured_level: 0,
              limit: 3)
Feed.create(
              url: 'http://noticias.uol.com.br/noticias/',
              host: 'http://uol.com.br/',
              selector: 'div.geral section article.news',
              url_pattern: 'h1 a',
              title: 'h1 a span',
              subtitle: 'p',
              image_source: 'h1 a img',
              date_tag: 'time',
              featured_level: 2,
              limit: 5)
Feed.create(
              url: 'http://www1.folha.uol.com.br/emcimadahora/',
              host: 'http://www1.folha.uol.com.br/',
              selector: '#newslist .nl2',
              url_pattern: '.nlArticle a',
              title: '.nlSection',
              subtitle: '.nlArticle a',
              date_tag: '.nlHour',
              featured_level: 2,
              limit: 8)
Feed.create(
              url: 'http://noticias.terra.com.br/ultimasnoticias/0,,EI188,00.html',
              host: 'http://terra.com.br/',
              selector: 'div.articles li',
              url_pattern: 'a',
              title: 'strong',
              subtitle: '',
              image_source: '',
              date_tag: '',
              featured_level: 2,
              limit: 5)
Feed.create(
              url: 'http://www.bbc.co.uk/portuguese/',
              host: 'http://www.bbc.co.uk/',
              selector: '.teaser',
              url_pattern: 'a',
              title: 'a',
              subtitle: '.summary',
              image_source: 'a img',
              featured_level: 0,
              limit: 3)
Feed.create(
              url: 'http://www.bbc.co.uk/portuguese/ultimas_noticias/',
              host: 'http://www.bbc.co.uk/',
              selector: '.content li.ts-headline',
              url_pattern: 'a',
              title: 'a',
              subtitle: '.summary',
              image_source: '',
              date_tag: '.date',
              featured_level: 2,
              limit: 8)
