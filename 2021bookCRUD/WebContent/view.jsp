<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%--Page directive content type--%>
 <%@page import="edu.handong.csee.dao.BookDao, edu.handong.csee.bean.BookVO"%> <%--Page directive import--%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<title>view Form</title>
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
	String id=request.getParameter("id");	
	BookVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<h1>책 상세정보 확인하기  </h1>
<form action="deletebook.jsp" method="post">
<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>

<div class="form_horizontal">
    <div class="form-group row">
    <label class="col-form-label col-sm-2" for="title">Title</label>
    <div class="col-sm-8">
      <input readonly class="form-control" name="title" value="<%= u.getTitle()%>" >
    </div>
</div>

<div class="form-group row">
    <label class="col-form-label col-sm-2" for="writer">Author</label>
    <div class="col-sm-7">
      <input readonly class="form-control" name="writer" value="<%= u.getWriter()%>" >
    </div>
</div>

<div class="form-group row">
    <label class="col-form-label col-sm-2" for="content">Comments</label>
    <div class="col-sm-10">
      <textarea readonly class="form-control" name="content" rows="7" cols="20"><%= u.getContent()%></textarea>
    </div>
</div>

	<div class="form-group row">
	  <label class="col-form-label col-sm-2" for="image">FileUrl</label>
	  <div class="col-sm-10">
    	<img width="300px" src="${pageContext.request.contextPath }/upload/<%=u.getImage()%>" alt="${pageContext.request.contextPath }/upload/<%=u.getImage()%>"/>
	  </div>
	</div>

      <div class="form-group row">
        <label class="col-form-label col-sm-2"></label>
        <div class="col-sm-10">
          <input type="button" value="Back" onclick="history.back()" class="btn btn-outline-dark cancel"/>
        </div>
      </div>
    </div>
</form>

 	<footer>
      <p>&copy; 2021 - AppTest</p>
    </footer>
    
</div>

</body>
</html>