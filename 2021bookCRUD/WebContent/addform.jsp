<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>AppTest</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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


<h1>새로운 책 추가하기</h1>
<form action="addbook.jsp" method="post" enctype="multipart/form-data">

  <div class="form-horizontal">
    <div class="form-group row">
    <label class="col-form-label col-sm-2" for="title">Title</label>
    <div class="col-sm-8">
      <input autofocus class="form-control" type="text" name="title" />
    </div>
</div>

<div class="form-group row">
    <label class="col-form-label col-sm-2" for="writer">Author</label>
    <div class="col-sm-7">
      <input class="form-control" type="text" name="writer" />
    </div>
</div>

<div class="form-group row">
    <label class="col-form-label col-sm-2" for="content">Comments</label>
    <div class="col-sm-10">
      <textarea class="form-control" name="content" rows="7" cols="20"></textarea>
    </div>
</div>

<div class="form-group row">
        <label class="col-form-label col-sm-2" for="image">File Upload</label>
        <div class="col-sm-7">
          <input type="file" class="form-control" name=image />
        </div>
    </div>


    <div class="form-group row">
      <label class="col-form-label col-sm-2"></label>
      <div class="col-sm-10">
        <input type="submit" value="Save" class="btn btn-default btn-success">
          <input type="button" value="Cancel" onclick="history.back()" class="btn btn-outline-dark cancel"/>
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

