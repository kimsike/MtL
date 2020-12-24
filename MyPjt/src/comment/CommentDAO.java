package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardBean;

public class CommentDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = ds.getConnection();
		
		return con;
	}//getConnection() ��
	
	public void allClose(){
		try {
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
		} catch (Exception e) {
			System.out.println("allClose�޼ҵ� ���ο��� ���� : " + e);
		}
	}//allClose() ��
	
	//��� �ֱ�
	public int insertComment(CommentBean commentBean){
		
		int num = 0;
		
		String sql = "";
		
		try {
			
			con = getConnection();
			
			sql = "select max(num) from comment;";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			
			sql = "insert into comment(date,ip,comment,num,content_num,id,re_ref,re_lev,re_seq)"
							+ "values(?,?,?,?,?,?,?,?,?);";	
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setTimestamp(1, commentBean.getDate());
			pstmt.setString(2, commentBean.getIp());
			pstmt.setString(3, commentBean.getComment());
			pstmt.setInt(4, num);
			pstmt.setInt(5, commentBean.getContent_num());
			pstmt.setString(6, commentBean.getId());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertBoard ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
		return num;
	}//insertComment�޼ҵ� ��
	
	public int getCommentCount(int num){
		
		int count = 0;
		
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select count(*) from comment where content_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getBoardCount���� ���� : " + e);
		} finally {
			allClose();
		}
		return count;
	}//getBoardCount()�޼ҵ� ��
	
	public CommentBean getComment(int num){
		String sql = "";
		CommentBean commentBean = new CommentBean();
		
		try {
			con = getConnection();
			
			sql = "select * from comment where content_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				commentBean.setComment(rs.getString("comment"));
				commentBean.setComment_num(rs.getInt("num"));
				commentBean.setComment_ref(rs.getInt("re_ref"));
				commentBean.setComment_lev(rs.getInt("re_lev"));
				commentBean.setComment_seq(rs.getInt("re_seq"));
				commentBean.setDate(rs.getTimestamp("date"));
				commentBean.setIp(rs.getString("ip"));
				commentBean.setContent_num(rs.getInt("content_num"));
				commentBean.setId(rs.getString("id"));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
		return commentBean;
	}//getComment�޼ҵ� ��
	
	//���۵� DB���� �����ͼ� �Խ��ǿ� ���̰� �ϱ�
	public List<CommentBean> getCommentList(int startRow, int pageSize, int num){
			
		String sql = "";
		List<CommentBean> commentList = new ArrayList<CommentBean>();
		
		try {
			con = getConnection();
			
			sql = "select * from comment where content_num=? order by re_ref asc, re_seq asc limit ?,?;";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				CommentBean commentBean = new CommentBean();
				
				commentBean.setComment_num(rs.getInt("num"));
				commentBean.setComment(rs.getString("comment"));
				commentBean.setContent_num(rs.getInt("content_num"));
				commentBean.setComment_ref(rs.getInt("re_ref"));
				commentBean.setComment_lev(rs.getInt("re_lev"));
				commentBean.setComment_seq(rs.getInt("re_seq"));
				commentBean.setDate(rs.getTimestamp("date"));
				commentBean.setIp(rs.getString("ip"));
				commentBean.setId(rs.getString("id"));
				
				commentList.add(commentBean);
				
			}
		} catch (Exception e) {
			System.out.println("commentList�޼ҵ� ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
		return commentList;
	}//getBoardList�޼ҵ� ��
	
	public void deleteComment(int num){
		
		String sql = "";
		try {
			con = getConnection();
			sql = "delete from comment where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//deleteComment�޼ҵ� ��
	
	public void updateComment(CommentBean commentBean){
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update comment set comment=?, date=?, ip=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, commentBean.getComment());
			pstmt.setTimestamp(2, commentBean.getDate());
			pstmt.setString(3, commentBean.getIp());
			pstmt.setInt(4, commentBean.getComment_num());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//updateComment�޼ҵ� ��
	
	public void reInsertComment(CommentBean commentBean){
		String sql = "";
		int num = 0;
		
		try {
			con = getConnection();
			sql = "select max(num) from comment;";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1) +1;
			}else{
				num = 1;
			}
			//re_seq��۵鳻�� ���� ���ġ
			//�ֱ��� �׷�� ���� �׷��̸鼭 �ֱ��� seq������ ū �亯�۵��� seq���� 1���� ��Ų��
			sql = "update comment set re_seq = re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentBean.getComment_ref());
			pstmt.setInt(2, commentBean.getComment_seq());
			pstmt.executeUpdate();
			
			//��� insert
			sql = "insert into comment(date,ip,comment,num,content_num,id,re_ref,re_lev,re_seq)"
					+ "values(?,?,?,?,?,?,?,?,?);";	
	
			pstmt = con.prepareStatement(sql);
			
			pstmt.setTimestamp(1, commentBean.getDate());
			pstmt.setString(2, commentBean.getIp());
			pstmt.setString(3, commentBean.getComment());
			pstmt.setInt(4, num);
			pstmt.setInt(5, commentBean.getContent_num());
			pstmt.setString(6, commentBean.getId());
			pstmt.setInt(7, commentBean.getComment_ref());
			pstmt.setInt(8, commentBean.getComment_lev()+1);
			pstmt.setInt(9, commentBean.getComment_seq()+1);
			
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//reInsertComment�޼ҵ� ��

}//commentDAOŬ���� ��
