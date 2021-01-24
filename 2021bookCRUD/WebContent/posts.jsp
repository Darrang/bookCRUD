<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%--Page directive content type--%>
<%@page import="edu.handong.csee.dao.BookDao, edu.handong.csee.bean.BookVO,java.util.*"%> <%--Page directive import--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%--taglib directive--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Book List</title>
<style>

</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletebook.jsp?id=' + id;
	}
</script>
</head>
<body>

  <div class="container">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="apptest.html">AppTest</a>
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="about.html">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="data.html">Data</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="posts.jsp">Books</a>
        </li>
      </ul>
    </nav>
    
<%
	BookDao boardDAO = new BookDao();
	List<BookVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>


<h1>List of books(${fn:length(list)-status.index})</h1>
<div class="table-responsive-sm">
<table class="table table-hover">
<thead>
<tr>
	<th>Title</th>
	<th>Author</th>
	<th>Comment</th>
	<th class="d-print-none">
		<a class="btn btn-sm btn-success" href="addform.jsp">Add</a>
	</th>
</tr>
</thead>

<tbody>
<c:forEach items="${list}" var="u" varStatus="status"> <%--EL--%>

	<tr>
		<td>${u.getTitle()}</td> <%--EL--%>
		<td>${u.getWriter()}</td> <%--EL--%>
		<td>${u.getContent()}</td> <%--EL--%>
		<td class="d-print-none">
			<a class="btn btn-sm btn-warning" href="editform.jsp?id=${u.getSeq()}">Edit</a> <%--EL--%>
			<a class="btn btn-sm btn-danger" href="javascript:delete_ok('${u.getSeq()}')">Delete</a>
            <a class="btn btn-sm" href="editform.jsp?id=${u.getSeq()}">More</a>
		</td> <%--EL--%>
</c:forEach>
</tbody>
</table>
</div>

<footer>
	<p>&copy; 2021 - AppTest</p>
</footer>
</div>
</body>
</html>