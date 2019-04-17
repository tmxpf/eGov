package egovframework.let.cop.gal.web;

import java.io.Serializable;

public class EgovGalVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2432306400963349091L;

	/*게시물 번호*/
	private int seq;
	
	/*게시물 제목*/
	private String title;
	
	/*게시물 내용*/
	private String content;
	
	/*이미지 경로*/
	private String imgPath;
	
	/*이미지 사이즈*/
	private int imgSize;
	
	/*이미지 이름*/
	private String imgName;
	
	/*이미지 타입*/
	private String imgType;
	
	/*등록 날짜*/
	private String date;
	

	
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

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getImgSize() {
		return imgSize;
	}

	public void setImgSize(int imgSize) {
		this.imgSize = imgSize;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgType() {
		return imgType;
	}

	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	
	
}
