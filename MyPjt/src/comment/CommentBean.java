package comment;

import java.sql.Timestamp;

public class CommentBean {

	private String comment; //댓글
	private int comment_num; //댓글번호
	private int comment_ref; //댓글 작성시 주댓글과 대댓글이 속한 그룹의 그룹값
	private int comment_lev; //댓글의 들여쓰기 정도값
	private int comment_seq; //댓글들 내의 순서값
	private Timestamp date; //글 작성 날짜
	private String ip; //글 작성한 클라이언트의 IP주소
	private int content_num; //댓글 작성한 글번호
	private String id;
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getComment_ref() {
		return comment_ref;
	}
	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}
	public int getComment_lev() {
		return comment_lev;
	}
	public void setComment_lev(int comment_lev) {
		this.comment_lev = comment_lev;
	}
	public int getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
