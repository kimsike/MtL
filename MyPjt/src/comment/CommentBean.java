package comment;

import java.sql.Timestamp;

public class CommentBean {

	private String comment; //���
	private int comment_num; //��۹�ȣ
	private int comment_ref; //��� �ۼ��� �ִ�۰� ������ ���� �׷��� �׷찪
	private int comment_lev; //����� �鿩���� ������
	private int comment_seq; //��۵� ���� ������
	private Timestamp date; //�� �ۼ� ��¥
	private String ip; //�� �ۼ��� Ŭ���̾�Ʈ�� IP�ּ�
	private int content_num; //��� �ۼ��� �۹�ȣ
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
