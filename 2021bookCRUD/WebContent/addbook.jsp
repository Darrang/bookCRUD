<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%--Page directive content type--%>
<%@page import="edu.handong.csee.dao.BookDao"%><%--Page directive import--%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="edu.handong.csee.bean.BookVO" /> <%--JSP Action Tag--%>
<jsp:setProperty property="*" name="u"/> <%--JSP Action Tag--%>

<%
	BookDao bookDAO = new BookDao();
	int i = bookDAO.insertBoard(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 삭제 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>
