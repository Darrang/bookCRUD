package edu.handong.csee.dao;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import edu.handong.csee.bean.BookVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUpload {
	public BookVO uploadPhoto(HttpServletRequest request) {
		String filename= "";
		int sizeLimit = 15 * 1024 * 1024;
		
		String realPath = request.getServletContext().getRealPath("upload");
		
		File dir = new File(realPath);
		if(!dir.exists()) dir.mkdirs();
		
		BookVO one = null;
		MultipartRequest multipartRequest = null;
		
		try {
			multipartRequest = new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
			filename = multipartRequest.getFilesystemName("image");
			one = new BookVO();
			String sid = multipartRequest.getParameter("seq");
			if(sid!=null&& !sid.equals("")) one.setSeq(Integer.parseInt(sid));
			one.setTitle(multipartRequest.getParameter("title"));
			one.setWriter(multipartRequest.getParameter("writer"));
			one.setContent(multipartRequest.getParameter("content"));
			
			if(sid!=null&&!sid.equals("")) {
				BookDao dao = new BookDao();
				String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
				if(filename!=null && oldfilename != null)
					FileUpload.deleteFile(request, oldfilename);
				else if(filename == null && oldfilename!=null)
					filename = oldfilename;
			}
			one.setImage(filename);
			
		}catch(IOException e){
			e.printStackTrace();
		}
		
		return one;
	}

	public static void deleteFile(HttpServletRequest request, String filename) {
		// TODO Auto-generated method stub
		String filePath = request.getServletContext().getRealPath("upload");
		
		File f = new File(filePath + "/" + filename);
		if(f.exists()) f.delete();
	}
}
