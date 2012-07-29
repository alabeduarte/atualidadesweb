function fetchNews() {
	fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
				, 'g1_news.json'
				, '#top-left'
	);
	fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
				, 'g1_bahia_news.json'
				, '#top-center'
	);
	fetchNewsFrom('http://www.metro1.com.br/portal/images/estrutura/logo.png'
				, 'metro1_news.json'
				, '#top-right'
	);
}

function fetchNewsFrom(logo, json, sectionId) {
	$(sectionId).css('display', 'block');
	$(sectionId).append($('<img src="' + logo + '" width="80px" height="50px">'));
	$(sectionId).append($('<ul>'));
	$.getJSON(json, function(data) {
		$.each(data, function(index, item){
			$(sectionId + ' ul').append($('<li>'));
			var url = item.url;
			var title = $.trim(item.title);
			var subtitle = $.trim(item.subtitle);
			var image = item.image;
			
			var urlId = 'url_' + index;
			
			if (!title) {
				title = subtitle;
			}
			var link = $('<a id="' + urlId + '" href="' + url + '" target="_blank">' + title + '</a>');
			$(sectionId + ' ul li:last').append(link);
			if (image) {
				link.append($('<img class="image-news" src="'+ image +'" width="106px height="62px">'));
			}
			if (subtitle && title != subtitle) {
				link.append($('<span>"'+ subtitle +'"</span>'));
			}
		});
	});
}