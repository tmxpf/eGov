package egovframework.let.main.web;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.let.cop.com.service.MemberVO;

@Repository("SignUpDAO")
public class SignUpDAO extends EgovComAbstractDAO{

	public void insertSignUp(MemberVO vo) {
		insert("insertMember", vo);
	}
	
	public MemberVO selectMemberId(MemberVO vo) {
		return (MemberVO)select("selectMemberId", vo);
	}
}
