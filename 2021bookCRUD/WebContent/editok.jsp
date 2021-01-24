<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%--Page directive content type--%>
<%@page import="edu.handong.csee.dao.BookDao"%> <%--Page directive import--%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="edu.handong.csee.bean.BookVO" /> <%--JSP Action--%>
<jsp:setProperty property="*" name="u"/> <%--JSP Action--%>

<%
	BookDao boardDAO = new BookDao();
	int i=boardDAO.updateBoard(u);
	response.sendRedirect("posts.jsp");
	String msg = "데이터 업데이트 성공 !";
	if(i == 0) msg = "[실패]";
%>