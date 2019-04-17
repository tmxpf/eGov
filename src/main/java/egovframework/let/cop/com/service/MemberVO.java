package egovframework.let.cop.com.service;

import java.io.Serializable;

public class MemberVO implements Serializable {

	private static final long serialVersionUID = -8237580329424813023L;

	/*이름*/
	String mbname;
	
	/*성별*/
	int sex;
	
	/*주민번호*/
	String dateOfBirth_1;
	
	/*주민번호*/
	String dateOfBirth_2;
	
	/*아이디*/
	String id;
	
	/*비밀번호*/
	String pw;
	
	/*이메일*/
	String email;
	
	/*이메일 주소*/
	String emaildns;
	
	/*휴대폰 번호*/
	String phone;
	
	/*주소*/
	String address;
	
	/*상세주소*/
	String detailaddress;
	
	/*이미지 경로*/
	String imagePath;
	
	/*파일 이름*/
	String fileName;
	
	/*파일 사이즈*/
	String fileSize;
	
	/*확장자*/
	String extention;
	
	public String getEmaildns() {
		return emaildns;
	}

	public void setEmaildns(String emaildns) {
		this.emaildns = emaildns;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMbname() {
		return mbname;
	}

	public void setMbname(String mbname) {
		this.mbname = mbname;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDateOfBirth_1() {
		return dateOfBirth_1;
	}

	public void setDateOfBirth_1(String dateOfBirth_1) {
		this.dateOfBirth_1 = dateOfBirth_1;
	}

	public String getDateOfBirth_2() {
		return dateOfBirth_2;
	}

	public void setDateOfBirth_2(String dateOfBirth_2) {
		this.dateOfBirth_2 = dateOfBirth_2;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getExtention() {
		return extention;
	}

	public void setExtention(String extention) {
		this.extention = extention;
	}
	
}
