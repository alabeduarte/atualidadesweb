function fetchNews() {
	fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
				, 'g1_news.json'
				, '#top-left'
	);
	fetchNewsFrom('http://s.glbimg.com/jo/g1/media/widget_header/img/marca.png'
				, 'g1_bahia_news.json'
				, '#top-center-left'
	);
	fetchNewsFrom('http://fw2.atarde.com.br/fw/img/2012/01/marcaAtarde1.png'
				, 'atarde_news.json'
				, '#top-center-right'
	);
	fetchNewsFrom('http://www.metro1.com.br/portal/images/estrutura/logo.png'
				, 'metro1_news.json'
				, '#top-right'
	);
}

function fetchNewsFrom(logo, json, sectionId) {
	$(sectionId).css('display', 'block');
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
			link.append($('<img src="' + logo + '" width="20px" height="12px">'));
			$(sectionId + ' ul li:last').append(link);
			if (image) {
				link.append($('<img class="image-news" src="'+ image +'" width="106px height="62px">'));
			}
			if (subtitle && title != subtitle) {
				link.append($('<span>"'+ subtitle +'"</span>'));
			}
			if ($('#content').height() < $(sectionId).height()) {
				$('#content').css('height', $(sectionId).height() + 'px');
			}
		});
	});
}