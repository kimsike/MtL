package search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SearchDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = ds.getConnection();
		
		return con;
		
	}//getConnection메소드
	
	public void allClose(){
		try {
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
		} catch (Exception e) {
			System.out.println("자원해제 실패 : " + e);
		}
	}//allClose(자원해제)메소드 끝
	
	public void insertbook(SearchBean searchBean){
		int num = 0;
		String sql = "";
		
		try{
			con = getConnection();
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			sql = "insert into search(num, title, author, publisher, publish_date, genre, image, subject"
				+ "value(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, searchBean.getTitle());
			pstmt.setString(3, searchBean.getAuthor());
			pstmt.setString(4, searchBean.getPublisher());
			pstmt.setDate(5, searchBean.getPublisher_date());
			pstmt.setString(6, searchBean.getGenre());
			pstmt.setString(7, searchBean.getImage());
			pstmt.setString(8, searchBean.getSubject());
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			allClose();
		}
	}
	
}
