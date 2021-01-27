<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%--Page directive content type--%>
<%@page import="edu.handong.csee.dao.BookDao"%><%--Page directive import--%>
<%@page import="edu.handong.csee.dao.FileUpload"%><%--Page directive import--%>
<%@page import="edu.handong.csee.bean.BookVO"%><%--Page directive import--%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	BookDao bookDAO = new BookDao();
	FileUpload upload = new FileUpload();
	BookVO u = upload.uploadPhoto(request);

	int i = bookDAO.insertBoard(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 삭제 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>
