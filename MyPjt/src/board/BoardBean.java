package board;

import java.sql.Timestamp;

public class BoardBean {
	
	private int num; //�۹�ȣ
	private String title; //����
	private String content; //����
	private String id; //�ۼ���
	private String password; //��й�ȣ
	private String file; //�ۼ��ڰ� ������ ���ϸ�
	private String savedFile; //����� ���ϸ�
	private int re_ref; //�亯�� �ۼ��� �ֱ۰� �亯���� ���� �׷��� �׷찪
	private int re_lev; //�亯���� �鿩���� ������
	private int re_seq; //�亯�۵� ���� ������
	private int readcount; //�� ��ȸ��
	private Timestamp date; //�� �ۼ� ��¥
	private String ip; //�� �ۼ��� Ŭ���̾�Ʈ�� IP�ּ�
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getSavedFile() {
		return savedFile;
	}
	public void setSavedFile(String savedFile) {
		this.savedFile = savedFile;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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

}

