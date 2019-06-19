<%@page import="data.Discography"%>
<%@page import="data.SingleDatabase"%>
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
				<li class="nav-item active"><a class="nav-link" href="single.jsp">Single</a></li>
				<li class="nav-item"><a class="nav-link"
					href="album.jsp">Album</a></li>
				<li class="nav-item"><a class="nav-link" href="ajax.jsp">Ajax</a></li>
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
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">発売日</th>
						<th scope="col">タイトル</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Discography d : SingleDatabase.SINGLES) {
					%>
					<tr>
						<td><%=d.getId()%></td>
						<td><%=d.getName()%></td>
						<td><%=d.getDate()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="text-muted">
		<div class="container">
			<p><%=new java.util.Date()%></p>
		</div>
	</div>
</body>
</html>