package board;

import java.sql.Timestamp;

public class BoardBean {
	
	private int num; //글번호
	private String title; //제목
	private String content; //내용
	private String id; //작성자
	private String password; //비밀번호
	private String file; //작성자가 지정한 파일명
	private String savedFile; //저장된 파일명
	private int re_ref; //답변글 작성시 주글과 답변글이 속한 그룹의 그룹값
	private int re_lev; //답변글의 들여쓰기 정도값
	private int re_seq; //답변글들 내의 순서값
	private int readcount; //글 조회수
	private Timestamp date; //글 작성 날짜
	private String ip; //글 작성한 클라이언트의 IP주소
	
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

