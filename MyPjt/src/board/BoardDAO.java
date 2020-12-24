package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import comment.CommentBean;

public class BoardDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = ds.getConnection();
		
		return con;
	}//getConnection() 끝
	
	public void allClose(){
		try {
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
		} catch (Exception e) {
			System.out.println("allClose메소드 내부에서 오류 : " + e);
		}
	}//allClose() 끝
	
	//글쓰고 디비에 넣기
	public void insertBoard(BoardBean boardBean){
		
		int num = 0;
		
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select max(num) from board;";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			sql = "insert into board(num,title,content,file,re_ref,re_lev,re_seq,readcount,date,ip,id,password,savedfile)"
							+ "values(?,	?,		?,	?,	  ?,  	?,		?,		?,		?,	?,	 ?,	  ?,	?);";	
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardBean.getTitle());
			pstmt.setString(3, boardBean.getContent());
			pstmt.setString(4, boardBean.getFile());
			pstmt.setInt(5, num);
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 0);
			pstmt.setTimestamp(9, boardBean.getDate());
			pstmt.setString(10, boardBean.getIp());
			pstmt.setString(11, boardBean.getId());
			pstmt.setString(12, boardBean.getPassword());
			pstmt.setString(13, boardBean.getSavedFile());
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertBoard 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
	}//insertBoard메소드 끝
	
	//쓴 글의 개수
	public int getBoardCount(String keyword, String searchValue){
		
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select count(*) from board";
			if(keyword != null || searchValue != null){
				sql += " where " +keyword+ " like '%"+searchValue+"%'";
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getBoardCount에서 오류 : " + e);
		} finally {
			allClose();
		}
		return count;
	}//getBoardCount()메소드 끝
	
	//DB에서 글목록 가져오기 (+검색목록)
	public List<BoardBean> getBoardList(int startRow, int pageSize, String keyword, String searchValue){
		
		String sql = "";
		List<BoardBean> boardList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			
			sql = "select * from board";
			if(keyword != null || searchValue != null){
				sql += " where " +keyword+ " like '%"+searchValue+"%'";
			}
			sql	+= " order by re_ref desc, re_seq asc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BoardBean boardBean = new BoardBean();
				
				boardBean.setNum(rs.getInt("num"));
				boardBean.setTitle(rs.getString("title"));
				boardBean.setContent(rs.getString("content"));
				boardBean.setFile(rs.getString("file"));
				boardBean.setSavedFile(rs.getString("savedfile"));
				boardBean.setRe_ref(rs.getInt("re_ref"));
				boardBean.setRe_lev(rs.getInt("re_lev"));
				boardBean.setRe_seq(rs.getInt("re_seq"));
				boardBean.setReadcount(rs.getInt("readcount"));
				boardBean.setDate(rs.getTimestamp("date"));
				boardBean.setIp(rs.getString("ip"));
				boardBean.setId(rs.getString("id"));
				boardBean.setPassword(rs.getString("password"));
				
				boardList.add(boardBean);
				
			}
		} catch (Exception e) {
			System.out.println("getBoardList메소드 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
		return boardList;
	}//getBoardList메소드 끝

	//글의 조회수
	public void updateReadCount(int num){
		String sql = "";
		try {
			con = getConnection();
			sql = "update board set readcount = readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateReadCount메소드 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
	}//updateReadCount메소드 끝
	
	//글번호에 해당하는 글 가져오기
	public BoardBean getBoard(int num){
		String sql = "";
		BoardBean boardBean = new BoardBean();
		
		try {
			con = getConnection();
			
			sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				boardBean.setNum(rs.getInt("num"));
				boardBean.setTitle(rs.getString("title"));
				boardBean.setContent(rs.getString("content"));
				boardBean.setFile(rs.getString("file"));
				boardBean.setRe_ref(rs.getInt("re_ref"));
				boardBean.setRe_lev(rs.getInt("re_lev"));
				boardBean.setRe_seq(rs.getInt("re_seq"));
				boardBean.setReadcount(rs.getInt("readcount"));
				boardBean.setDate(rs.getTimestamp("date"));
				boardBean.setIp(rs.getString("ip"));
				boardBean.setId(rs.getString("id"));
				boardBean.setPassword(rs.getString("password"));	
				boardBean.setSavedFile(rs.getString("savedfile"));
			}
		} catch (Exception e) {
			System.out.println("getBoar메소드 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
		return boardBean;
	}//getBoard메소드 끝
	
	//글삭제
	public void deleteContent(int num){
		
		String sql = "";
		
		try {
				con = getConnection();
				
				sql = "delete from board where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
				sql = "delete from comment where content_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("deleteContent메소드 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
		
	}//deleteContent메소드 끝
	
	//글수정
	public void updateContent(BoardBean boardBean){
		String sql = "";
		try {	
			con = getConnection();
			sql = "update board set title=?, content=?, file=?, savedfile=?, date=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardBean.getTitle());
			pstmt.setString(2, boardBean.getContent());
			pstmt.setString(3, boardBean.getFile());
			pstmt.setString(4, boardBean.getSavedFile());
			pstmt.setTimestamp(5, boardBean.getDate());
			pstmt.setInt(6, boardBean.getNum());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateContent메소드 내부에서 오류	: " + e);
		} finally {
			allClose();
		}
	}//updateContent메소드 끝
	/*
		답변달기 규칙
		1.답글 그룹번호(re_ref)는 주글의 그룹번호(re_ref)를 사용한다.
		2.같은 그룹의 글들의 내의 순서값(re_seq)은 주글의 re_seq에 +1증가 한값을 넣어준다
		3. 답글의 들여쓰기 정도값(re_lev)은 주글의 re_lev값에 +1증가 한 값을 넣어서 사용한다.
		
		답변글의 DB에 insert하는 메소드 만들기
	 */
	
	public void reInsertBoard(BoardBean boardBean){
		String sql = "";
		int num = 0;
		
		try {
			con = getConnection();
			sql = "select max(num) from board;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1) +1;
			}else{
				num = 1;
			}
			//re_seq답글들내의 순서 재배치
			//주글의 그룹과 같은 그룹이면서 주글의 seq값보다 큰 답변글들은 seq값을 1증가 시킨다
			sql = "update board set re_seq = re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardBean.getRe_ref());
			pstmt.setInt(2, boardBean.getRe_seq());
			pstmt.executeUpdate();
			
			//답글 insert
			sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardBean.getId());
			pstmt.setString(3, boardBean.getPassword());
			pstmt.setString(4, boardBean.getTitle());
			pstmt.setString(5, boardBean.getContent());
			pstmt.setString(6, boardBean.getFile());
			pstmt.setString(7, boardBean.getSavedFile());
			pstmt.setInt(8, boardBean.getRe_ref());
			pstmt.setInt(9, boardBean.getRe_lev()+1);
			pstmt.setInt(10, boardBean.getRe_seq()+1);
			pstmt.setInt(11, boardBean.getReadcount());
			pstmt.setTimestamp(12, boardBean.getDate());
			pstmt.setString(13, boardBean.getIp());
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//reInsertBoard메소드 끝
	
	public void deleteFile(int num){
		String sql = "";
		try {
			con = getConnection();
			sql = "update board set file=null, savedfile=null where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//deleteFile메소드 끝
	
	
}//BoardDAO클래스 끝
