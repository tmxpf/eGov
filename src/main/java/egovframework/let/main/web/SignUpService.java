package egovframework.let.main.web;

import egovframework.let.cop.com.service.MemberVO;

public interface SignUpService {

	public void insertMemberInfo(MemberVO vo);
	
	public MemberVO selectMemberInfo(MemberVO vo);
}
