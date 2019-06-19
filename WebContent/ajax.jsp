<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Store - Single</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="single.jsp">Music Store</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="single.jsp">Single</a></li>
				<li class="nav-item"><a class="nav-link" href="album.jsp">Album</a></li>
				<li class="nav-item active"><a class="nav-link" href="ajax.jsp">Ajax</a></li>
			</ul>
		</div>
	</nav>

	<div class="main">
		<div class="jumbotron text-center">
			<div class="container">
				<h1 class="jumbotron-heading">シングル</h1>
				<p class="lead text-muted">In February 2014, she won the Best
					New Actress Award in the 8th Seiyu Awards. She debuted as a singer
					under Pony Canyon with the song Soushou no Innocence, which is
					produced by Tomita Akihiro.</p>
			</div>
		</div>
		<div class="container">
			<button id="load-single-button" class="btn btn-primary" type="button">
				<span id="load-single-spinner" class="spinner-border spinner-border-sm" role="status"
					aria-hidden="true" style="visibility: hidden;"></span>
					Load singles
			</button>			
			<button id="load-album-button" class="btn btn-primary" type="button">
				<span id="load-album-spinner" class="spinner-border spinner-border-sm" role="status"
					aria-hidden="true" style="visibility: hidden;"></span>
					Load albums
			</button>
			</div>
		<div class="container">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">発売日</th>
						<th scope="col">タイトル</th>
					</tr>
				</thead>
				<tbody id="discographies">
				</tbody>
			</table>
			<div class="spinner-border" role="status" id="discographies-spinner"
				style="visibility: hidden;">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
	<div class="text-muted">
		<div class="container">
			<p><%=new java.util.Date()%></p>
		</div>
	</div>
	<script type="text/javascript">
		loadDiscographies = function(url) {
			var xhr = new XMLHttpRequest();
			xhr.open('GET', url);
			xhr.onload = function() {
				if (xhr.status === 200) {
					document.getElementById("load-single-spinner").style.visibility = "hidden";
					document.getElementById("load-album-spinner").style.visibility = "hidden";
					loadSingleLink.classList.remove("disabled");
					loadAlbumLink.classList.remove("disabled");
					var discographies = JSON.parse(xhr.responseText)
					var parent = document.getElementById('discographies')
					while (parent.lastChild) {
						parent.removeChild(parent.lastChild);
					}
					for (var i = 0; i < discographies.length; i++) {
						var discography = discographies[i];
						var row = document.createElement('tr');
						var cell_id = document.createElement('td');
						cell_id.innerText = discography.id;
						row.appendChild(cell_id);
						var cell_name = document.createElement('td');
						cell_name.innerText = discography.name;
						row.appendChild(cell_name);
						var cell_date = document.createElement('td');
						cell_date.innerText = discography.date;
						row.appendChild(cell_date);
						parent.appendChild(row);
					}

					//alert("First Album is :" + discographies[0].name)
				}
			}

			wait = 2000;
			timer = setInterval(function() {
				clearInterval(timer)
				xhr.send();
			}, wait);
		}
		loadSingleLink = document.getElementById("load-single-button");
		loadAlbumLink = document.getElementById("load-album-button");
		loadSingleLink.onclick = function() {
			var spinner = document.getElementById("load-single-spinner")
			spinner.style.visibility = "visible";
			
			loadDiscographies("SingleList")
			loadAlbumLink.classList.add("disabled");
			loadSingleLink.classList.add("disabled");
		}
		loadAlbumLink.onclick = function() {
			var spinner = document.getElementById("load-album-spinner")
			spinner.style.visibility = "visible";
			
			loadDiscographies("AlbumList")
			loadAlbumLink.classList.add("disabled");
			loadSingleLink.classList.add("disabled");
		}
	</script>
</body>
</html>