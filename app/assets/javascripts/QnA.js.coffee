QnA = {}

QnA.autoSelectSearch = ->
	window.onload = ->
		keyword = document.getElementById 'keyword'
		keyword.onclick = ->
			@select()


QnA.autoSelectSearch()