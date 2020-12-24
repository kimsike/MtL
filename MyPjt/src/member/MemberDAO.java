package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		
		con = ds.getConnection();
		
		return con;
		
	}//getConnection�޼ҵ�
	
	public void allClose(){
		try {
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(con != null) con.close();
		} catch (Exception e) {
			System.out.println("�ڿ����� ���� : " + e);
		}
	}//allClose(�ڿ�����)�޼ҵ� ��
	
	public int userCheck(String id, String password){
		
		int check = -1;
		
		try {
			 con = getConnection();
			 
			 String sql = "select password from member where id=?";
			 
			 pstmt = con.prepareStatement(sql);
			 
			 pstmt.setString(1, id);
			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()){
				 if(password.equals(rs.getString("password"))){
					 check = 1;
					
				 }else{
					 check = 0;
				 }
			 }else{
				 check = -1;
			 }
			 
		} catch (Exception e) {
			System.out.println("userCheck�޼ҵ� ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
		return check;
	}//userCheck�޼ҵ�
	
	public void insertMember(MemberBean mb){
		
		String sql = "";
		
		try {
			con = getConnection();
			sql = "insert into member(id, password, name, email, mobile, reg_date, tel, birth, postcode, address1, address2, address3)"
						   + "values (?,	?,		?,		?,		?,		now(),	?,	?,		?,			?,		?,			?);";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPassword());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5, mb.getMobile());
			pstmt.setString(6, mb.getTel());
			pstmt.setDate(7, mb.getBirth());
			pstmt.setString(8, mb.getPostcode());
			pstmt.setString(9, mb.getAddress1());
			pstmt.setString(10, mb.getAddress2());
			pstmt.setString(11, mb.getAddress3());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertMember ���ο��� ���� : " + e);
		} finally {
			allClose();
		}
	}//insertMember�޼ҵ� ��
	
	public int idCheck(String id){
		String sql = "";
		
		int check = 0;
		
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				check = 1; //���̵� �ߺ�
			}else{
				check = 0; //���̵� �ߺ� X
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
		return check;
	}//idCheck�޼ҵ� ��
	
	//id�� �ش��ϴ� ������������
	public MemberBean getMember(String id){
		String sql = "";
		MemberBean memberBean = new MemberBean();
		
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				memberBean.setId(rs.getString("id"));
				memberBean.setPassword(rs.getString("password"));
				memberBean.setName(rs.getString("name"));
				memberBean.setEmail(rs.getString("email"));
				memberBean.setMobile(rs.getString("mobile"));
				memberBean.setReg_date(rs.getTimestamp("reg_date"));
				memberBean.setTel(rs.getString("tel"));
				memberBean.setBirth(rs.getDate("birth"));
				memberBean.setPostcode(rs.getString("postcode"));
				memberBean.setAddress1(rs.getString("address1"));
				memberBean.setAddress2(rs.getString("address2"));
				memberBean.setAddress3(rs.getString("address3"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
		return memberBean;
	}
	
	//ȸ��Ż��
	public void deleteMember(String id){
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "delete from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			sql = "delete from board where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			sql = "delete from comment where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			sql = "delete from galllery where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			sql = "delete from galllery_comment where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//deleteMember�޽��� ��
	
	//ȸ������ ����
	public void updateMember(MemberBean memberBean, String id){
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update member set mobile=?, postcode=?, address1=?, address2=?, address3=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getMobile());
			pstmt.setString(2, memberBean.getPostcode());
			pstmt.setString(3, memberBean.getAddress1());
			pstmt.setString(4, memberBean.getAddress2());
			pstmt.setString(5, memberBean.getAddress3());
			pstmt.setString(6, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}//updateMember�޼ҵ� ��
	
	//��й�ȣ ����
	public void updatePassword(String newPassword, String id){
		String sql = "";
		
		try {
			con = getConnection();
			sql = "update member set password=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			allClose();
		}
	}
	
}//MemberDAOŬ����
