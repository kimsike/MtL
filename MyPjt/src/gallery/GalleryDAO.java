package gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class GalleryDAO {
	
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
			e.printStackTrace();
		}
	}//allClose() 끝
	
	public void insertGallery(GalleryBean galleryBean){
		int num = 0;
		String sql = "";
		try {
			con = getConnection();
			sql = "select max(num) from gallery";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1) + 1;
			}else{
				num = 1;
			}
			
			sql = "insert into gallery(num, title, content, id, password, first_image, thumbnail, readcount, date, ip)"
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, galleryBean.getTitle());
			pstmt.setString(3, galleryBean.getContent());
			pstmt.setString(4, galleryBean.getId());
			pstmt.setString(5, galleryBean.getPassword());
			pstmt.setString(6, galleryBean.getFirst_image());
			pstmt.setString(7, galleryBean.getThumbnail());
			pstmt.setInt(8, 0);;
			pstmt.setTimestamp(9, galleryBean.getDate());
			pstmt.setString(10, galleryBean.getIp());
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//insertGallery메소드 끝
	
	public int getGalleryCount(String keyword, String searchValue){
		
		int count = 0;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select count(*) from gallery";
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
	}//getGalleryCount()메소드 끝
	
	//DB에서 글목록 가져오기(+검색목록)
	public List<GalleryBean> getGalleryList(int startRow, int pageSize, String keyword, String searchValue){
		
		String sql = "";
		List<GalleryBean> galleryList = new ArrayList<GalleryBean>();
		
		try {
			con = getConnection();
			sql = "select * from gallery";
			if(keyword != null || searchValue != null){
				sql += " where " +keyword+ " like '%"+searchValue+"%'";
			}
			sql	+= " order by num desc limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				GalleryBean galleryBean = new GalleryBean();
				
				galleryBean.setNum(rs.getInt("num"));
				galleryBean.setTitle(rs.getString("title"));
				galleryBean.setContent(rs.getString("content"));
				galleryBean.setFirst_image(rs.getString("first_image"));
				galleryBean.setThumbnail(rs.getString("thumbnail"));
				galleryBean.setReadcount(rs.getInt("readcount"));
				galleryBean.setDate(rs.getTimestamp("date"));
				galleryBean.setIp(rs.getString("ip"));
				galleryBean.setId(rs.getString("id"));
				galleryBean.setPassword(rs.getString("password"));
				
				galleryList.add(galleryBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
		return galleryList;
	}//getGalleryList메소드 끝
	
	//글의 조회수
	public void updateReadCount(int num){
		String sql = "";
		try {
			con = getConnection();
			sql = "update gallery set readcount = readcount+1 where num=?";
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
	public GalleryBean getGallery(int num){
		String sql = "";
		GalleryBean galleryBean = new GalleryBean();
		
		try {
			con = getConnection();
			
			sql = "select * from gallery where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				galleryBean.setNum(rs.getInt("num"));
				galleryBean.setTitle(rs.getString("title"));
				galleryBean.setContent(rs.getString("content"));
				galleryBean.setFirst_image(rs.getString("first_image"));
				galleryBean.setThumbnail(rs.getString("thumbnail"));
				galleryBean.setReadcount(rs.getInt("readcount"));
				galleryBean.setDate(rs.getTimestamp("date"));
				galleryBean.setIp(rs.getString("ip"));
				galleryBean.setId(rs.getString("id"));
				galleryBean.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
		return galleryBean;
	}//getGallery메소드 끝
	
	//글삭제
	public void deleteGalleryContent(int num){
		
		String sql = "";
		
		try {
				con = getConnection();
				
				sql = "delete from gallery where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
				sql = "delete from gallery_comment where content_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
		} catch (Exception e) {
			System.out.println("deleteContent메소드 내부에서 오류 : " + e);
		} finally {
			allClose();
		}
		
	}//deleteGalleryContent메소드 끝
	
	//글수정
	public void updateGallery(GalleryBean galleryBean){
		String sql = "";
		try {
			con = getConnection();
			sql = "update gallery set title=?, content=?, first_image=?, date=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, galleryBean.getTitle());
			pstmt.setString(2, galleryBean.getContent());
			pstmt.setString(3, galleryBean.getFirst_image());
			pstmt.setTimestamp(4, galleryBean.getDate());
			pstmt.setInt(5, galleryBean.getNum());
			
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//updateGallery메소드 끝
	
	public List<GalleryBean> getGalleryNewContent(){
		
		String sql = "";
		List<GalleryBean> galleryList = new ArrayList<GalleryBean>();
		
		try {
			con = getConnection();
			sql = "select * from gallery order by date desc limit 3";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				GalleryBean galleryBean = new GalleryBean();
				
				galleryBean.setNum(rs.getInt("num"));
				galleryBean.setTitle(rs.getString("title"));
				galleryBean.setContent(rs.getString("content"));
				galleryBean.setFirst_image(rs.getString("first_image"));
				galleryBean.setThumbnail(rs.getString("thumbnail"));
				galleryBean.setReadcount(rs.getInt("readcount"));
				galleryBean.setDate(rs.getTimestamp("date"));
				galleryBean.setIp(rs.getString("ip"));
				galleryBean.setId(rs.getString("id"));
				galleryBean.setPassword(rs.getString("password"));
				
				galleryList.add(galleryBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
		return galleryList;
	}//getGalleryList메소드 끝
	

}//GalleryDAO클래스 끝

