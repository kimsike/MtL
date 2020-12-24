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
	
	//�۾��� ��� �ֱ�
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
			System.out.println("insertBoard ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
	}//insertBoard�޼ҵ� ��
	
	//�� ���� ����
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
			System.out.println("getBoardCount���� ���� : " + e);
		} finally {
			allClose();
		}
		return count;
	}//getBoardCount()�޼ҵ� ��
	
	//DB���� �۸�� �������� (+�˻����)
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
			System.out.println("getBoardList�޼ҵ� ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
		return boardList;
	}//getBoardList�޼ҵ� ��

	//���� ��ȸ��
	public void updateReadCount(int num){
		String sql = "";
		try {
			con = getConnection();
			sql = "update board set readcount = readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateReadCount�޼ҵ� ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
	}//updateReadCount�޼ҵ� ��
	
	//�۹�ȣ�� �ش��ϴ� �� ��������
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
			System.out.println("getBoar�޼ҵ� ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
		return boardBean;
	}//getBoard�޼ҵ� ��
	
	//�ۻ���
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
			System.out.println("deleteContent�޼ҵ� ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
		
	}//deleteContent�޼ҵ� ��
	
	//�ۼ���
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
			System.out.println("updateContent�޼ҵ� ���ο��� ����	: " + e);
		} finally {
			allClose();
		}
	}//updateContent�޼ҵ� ��
	/*
		�亯�ޱ� ��Ģ
		1.��� �׷��ȣ(re_ref)�� �ֱ��� �׷��ȣ(re_ref)�� ����Ѵ�.
		2.���� �׷��� �۵��� ���� ������(re_seq)�� �ֱ��� re_seq�� +1���� �Ѱ��� �־��ش�
		3. ����� �鿩���� ������(re_lev)�� �ֱ��� re_lev���� +1���� �� ���� �־ ����Ѵ�.
		
		�亯���� DB�� insert�ϴ� �޼ҵ� �����
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
			//re_seq��۵鳻�� ���� ���ġ
			//�ֱ��� �׷�� ���� �׷��̸鼭 �ֱ��� seq������ ū �亯�۵��� seq���� 1���� ��Ų��
			sql = "update board set re_seq = re_seq+1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardBean.getRe_ref());
			pstmt.setInt(2, boardBean.getRe_seq());
			pstmt.executeUpdate();
			
			//��� insert
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
	}//reInsertBoard�޼ҵ� ��
	
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
	}//deleteFile�޼ҵ� ��
	
	
}//BoardDAOŬ���� ��
