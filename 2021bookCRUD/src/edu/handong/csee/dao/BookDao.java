package edu.handong.csee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import edu.handong.csee.bean.BookVO;
import edu.handong.csee.utill.JDBCUtil;

public class BookDao {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	private final String BOARD_INSERT = "insert into BOARD2 (title, writer, content,image) values (?,?,?,?)";
	private final String BOARD_UPDATE = "update BOARD2 set title=?, writer=?, content=? image=? where seq=?";
	private final String BOARD_DELETE = "delete from BOARD2  where seq=?";
	private final String BOARD_GET = "select * from BOARD2  where seq=?";
	private final String BOARD_LIST = "select * from BOARD2 order by seq desc";

	public int insertBoard(BookVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);

			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setString(4, vo.getImage());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteBoard(BookVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getSeq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateBoard(BookVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setString(4, vo.getImage());
			stmt.setInt(4, vo.getSeq());

			System.out.println(vo.getTitle() + "-" + vo.getWriter() + "-" + vo.getContent() + "-" + vo.getImage()+ "-" + vo.getSeq());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public BookVO getBoard(int seq) {
		BookVO one = new BookVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSeq(rs.getInt("seq"));
				one.setTitle(rs.getString("title"));
				one.setWriter(rs.getString("writer"));
				one.setContent(rs.getString("content"));
				one.setImage(rs.getString("image"));
				one.setCnt(rs.getInt("cnt"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<BookVO> getBoardList(){
		List<BookVO> list = new ArrayList<BookVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				BookVO one = new BookVO();
				one.setSeq(rs.getInt("seq"));
				one.setTitle(rs.getString("title"));
				one.setWriter(rs.getString("writer"));
				one.setContent(rs.getString("content"));
				one.setRegdate(rs.getDate("regdate"));
				one.setCnt(rs.getInt("cnt"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public String getPhotoFilename(int sid) {
		String filename = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				filename = rs.getString("image");
			}
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
		return filename;
	}
	
}
