function fetchNews() {
	fetchGloboEsporteNews();
}

function fetchGloboEsporteNews() {
	var mainDiv = $('#globoesporte_feed');
	var logo = 'http://s.glbimg.com/es/ge/static/globoesporte/img/logo-globoesporte-internas.png?2e69862f0df7';
	mainDiv.css('display', 'block');
	mainDiv.append($('<img src="' + logo + '" width="80px" height="50px">'));
	var ul = mainDiv.append($('<ul>'));
	$.getJSON('globoesporte_news.json', function(data) {
		$.each(data, function(index, item){
			ul.append($('<li>'));
			var description = $.trim(item.title);
			
			var urlId = 'url_' + index;
			var link = $('<a id="' + urlId + '" href="' + item.url + '" target="_blank">' + description + '</a>');
			$('#globoesporte_feed ul li:last').append(link);
		});
	});
}