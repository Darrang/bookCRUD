<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%--Page directive content type--%>
<%@page import="edu.handong.csee.dao.BookDao, edu.handong.csee.bean.BookVO"%> <%--Page directive import--%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		BookVO u = new BookVO();
		u.setSeq(id);
		BookDao boardDAO = new BookDao();
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>