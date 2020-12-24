package galleryComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;

public class GalleryCommentDAO {
	
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
	
	//댓글 넣기
	public int insertComment(GalleryCommentBean gcommentBean){
		
		int num = 0;
		
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select max(num) from gallery_comment;";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			
			sql = "insert into gallery_comment(date,ip,comment,num,content_num,id,re_ref,re_lev,re_seq)"
							+ "values(?,?,?,?,?,?,?,?,?);";	
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setTimestamp(1, gcommentBean.getDate());
			pstmt.setString(2, gcommentBean.getIp());
			pstmt.setString(3, gcommentBean.getComment());
			pstmt.setInt(4, num);
			pstmt.setInt(5, gcommentBean.getContent_num());
			pstmt.setString(6, gcommentBean.getId());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertBoard 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
		return num;
	}//insertComment메소드 끝
	
	public int getCommentCount(int num){
		
		int count = 0;
		
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select count(*) from gallery_comment where content_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	public GalleryCommentBean getComment(int num){
		String sql = "";
		GalleryCommentBean gcommentBean = new GalleryCommentBean();
		
		try {
			con = getConnection();
			
			sql = "select * from gallery_comment where content_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				gcommentBean.setComment(rs.getString("comment"));
				gcommentBean.setComment_num(rs.getInt("num"));
				gcommentBean.setComment_ref(rs.getInt("re_ref"));
				gcommentBean.setComment_lev(rs.getInt("re_lev"));
				gcommentBean.setComment_seq(rs.getInt("re_seq"));
				gcommentBean.setDate(rs.getTimestamp("date"));
				gcommentBean.setIp(rs.getString("ip"));
				gcommentBean.setContent_num(rs.getInt("content_num"));
				gcommentBean.setId(rs.getString("id"));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
		return gcommentBean;
	}//getComment메소드 끝
	
	//쓴글들 DB에서 가져와서 게시판에 보이게 하기
	public List<GalleryCommentBean> getCommentList(int startRow, int pageSize, int num){
			
		String sql = "";
		List<GalleryCommentBean> gcommentList = new ArrayList<GalleryCommentBean>();
		
		try {
			con = getConnection();
			
			sql = "select * from gallery_comment where content_num=? order by re_ref asc, re_seq asc limit ?,?;";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				GalleryCommentBean gcommentBean = new GalleryCommentBean();
				
				gcommentBean.setComment_num(rs.getInt("num"));
				gcommentBean.setComment(rs.getString("comment"));
				gcommentBean.setContent_num(rs.getInt("content_num"));
				gcommentBean.setComment_ref(rs.getInt("re_ref"));
				gcommentBean.setComment_lev(rs.getInt("re_lev"));
				gcommentBean.setComment_seq(rs.getInt("re_seq"));
				gcommentBean.setDate(rs.getTimestamp("date"));
				gcommentBean.setIp(rs.getString("ip"));
				gcommentBean.setId(rs.getString("id"));
				
				gcommentList.add(gcommentBean);
				
			}
		} catch (Exception e) {
			System.out.println("commentList메소드 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
		return gcommentList;
	}//getBoardList메소드 끝
	
	public void deleteComment(int num){
		
		String sql = "";
		try {
			con = getConnection();
			sql = "delete from gallery_comment where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//deleteComment메소드 끝
	
	public void updateComment(GalleryCommentBean galleryCommentBean){
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update gallery_comment set comment=?, date=?, ip=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, galleryCommentBean.getComment());
			pstmt.setTimestamp(2, galleryCommentBean.getDate());
			pstmt.setString(3, galleryCommentBean.getIp());
			pstmt.setInt(4, galleryCommentBean.getComment_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//updateComment메소드 끝
	
}//commentDAO클래스 끝
