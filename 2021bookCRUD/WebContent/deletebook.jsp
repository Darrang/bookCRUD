<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%--Page directive content type--%>
<%@page import="edu.handong.csee.dao.BookDao, edu.handong.csee.bean.BookVO, edu.handong.csee.dao.FileUpload"%> <%--Page directive import--%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		BookDao boardDAO = new BookDao();
		String filename = boardDAO.getPhotoFilename(id);
		if(filename != null)
			FileUpload.deleteFile(request, filename);
		
		BookVO u = new BookVO();
		u.setSeq(id);
		
		boardDAO.deleteBoard(u);
	}
	response.sendRedirect("posts.jsp");
%>