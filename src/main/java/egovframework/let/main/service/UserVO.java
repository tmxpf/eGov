package egovframework.let.main.service;

import java.io.Serializable;

public class UserVO implements Serializable{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4767646286073862007L;

	/**
	 * 사용자 이름
	 */
	String USER_NM;
	
	/**
	 * 사용자 아이디
	 */
	String EMPLYR_ID;
	
	/**
	 * 사용자 패스워드
	 */
	String PASSWORD;
	
	/**
	 * 사용자 권한ID인듯?
	 */
	String ORGNZT_ID;
	
	/**
	 * 그룹 아이디
	 */
	String GROUP_ID;
	
	/**
	 * 성별
	 */
	String SEX;
	
	/**
	 * 생년월일
	 */
	int dateOfBirth;
	
	/**
	 * e-Mail
	 */
	String eMail;
	
	/**
	 * PSTINST_CODE
	 */
	String PSTINST_CODE;
	
	/**
	 * PSTINST_CODE
	 */
	String SBSCRB_DE;
	
	
	
	public String getUSER_NM() {
		return USER_NM;
	}

	public void setUSER_NM(String uSER_NM) {
		USER_NM = uSER_NM;
	}

	public String getEMPLYR_ID() {
		return EMPLYR_ID;
	}

	public void setEMPLYR_ID(String eMPLYR_ID) {
		EMPLYR_ID = eMPLYR_ID;
	}

	public String getORGNZT_ID() {
		return ORGNZT_ID;
	}

	public void setORGNZT_ID(String oRGNZT_ID) {
		ORGNZT_ID = oRGNZT_ID;
	}
	
	
}
